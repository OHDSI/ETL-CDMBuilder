using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using org.ohdsi.cdm.framework.core.CommonVocabulary;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Lookups;
using org.ohdsi.cdm.framework.entities.DataReaders;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;
using org.ohdsi.cdm.framework.shared.Helpers;

namespace org.ohdsi.cdm.framework.core
{
   public class Vocabulary
   {
      private GenderLookup genderConcepts;
      private EntityLookup<Location> locationConcepts;
      private EntityLookup<Organization> organizationConcepts;
      private EntityLookup<CareSite> careSiteConcepts;
      private EntityLookup<Provider> providerConcepts;
      private MultiLookup ingredientLevel;
      private BaseLookup daysSupplyLookup;

      private Dictionary<string, MultiLookup> lookups;
      private Dictionary<string, SourceLookup> sourceLookups;
      private Dictionary<string, ReferenceFileLookup> rfLookups;
      private bool initialized;

      private void LoadEntityLookup()
      {
         var connection = Settings.Current.Building.SourceConnectionString;
         var queryDefinitions = Settings.Current.Building.SourceQueryDefinitions;

         locationConcepts = new EntityLookup<Location>(connection);
         organizationConcepts = new EntityLookup<Organization>(connection);
         careSiteConcepts = new EntityLookup<CareSite>(connection);
         providerConcepts = new EntityLookup<Provider>(connection);

         var location = queryDefinitions.FirstOrDefault(qd => qd.Locations != null);
         if (location != null)
         {
            locationConcepts.Load(location, location.Locations[0]);
         }

         if (locationConcepts.Lookup.Count == 0)
            locationConcepts.Lookup.Add("0", new Location {Id = 1});

         var organization = queryDefinitions.FirstOrDefault(qd => qd.Organizations != null);
         if (organization != null)
         {
            organizationConcepts.Load(organization, organization.Organizations[0]);
         }

         if (organizationConcepts.Lookup.Count == 0)
            organizationConcepts.Lookup.Add("0",
               new Organization {Id = 0, LocationId = 0, ConceptId = 0, SourceValue = string.Empty});

         var careSite = queryDefinitions.FirstOrDefault(qd => qd.CareSites != null);
         if (careSite != null)
         {
            careSiteConcepts.Load(careSite, careSite.CareSites[0]);
         }

         if (careSiteConcepts.Lookup.Count == 0)
            careSiteConcepts.Lookup.Add("0",
               new CareSite {Id = 0, LocationId = 0, OrganizationId = 0, PlaceOfSvcSourceValue = null});
      }

      private void SaveEntityLookup(bool saveToDb)
      {
         if (saveToDb)
         {
            using (var c = SqlConnectionHelper.OpenConnection(Settings.Current.Building.DestinationConnectionString))
            using (var bulkCopy = new SqlBulkCopy(c, SqlBulkCopyOptions.TableLock, null))
            {
               if (locationConcepts != null)
                  bulkCopy.Write(new LocationDataReader(locationConcepts.Lookup.Values.ToList()), "LOCATION");

               if (organizationConcepts != null)
                  bulkCopy.Write(new OrganizationDataReader(organizationConcepts.Lookup.Values.ToList()), "ORGANIZATION");

               if (careSiteConcepts != null)
                  bulkCopy.Write(new CareSiteDataReader(careSiteConcepts.Lookup.Values.ToList()), "CARE_SITE");

               if (providerConcepts != null)
                  bulkCopy.Write(new ProviderDataReader(providerConcepts.Lookup.Values.ToList()), "PROVIDER");

               bulkCopy.Close();
            }
         }
         else
         {
            var folder = Settings.Current.ResultFolder;
            if (locationConcepts != null)
               SaveToFile(folder, new LocationDataReader(locationConcepts.Lookup.Values.ToList()), "LOCATION");

            if (organizationConcepts != null)
               SaveToFile(folder, new OrganizationDataReader(organizationConcepts.Lookup.Values.ToList()),
                  "ORGANIZATION");

            if (careSiteConcepts != null)
               SaveToFile(folder, new CareSiteDataReader(careSiteConcepts.Lookup.Values.ToList()), "CARE_SITE");

            if (providerConcepts != null)
               SaveToFile(folder, new ProviderDataReader(providerConcepts.Lookup.Values.ToList()), "PROVIDER");
         }
      }

      //TMP
      private void SaveToFile(string folder, System.Data.IDataReader reader, string tableName)
      {
         //var folder = BuildingContext.ResultFolder;
         folder = Path.Combine(folder, tableName);
         if (!Directory.Exists(folder))
            Directory.CreateDirectory(folder);

         var fileName = Path.Combine(folder, tableName);

         if (File.Exists(fileName))
            File.Delete(fileName);

         using (var writer = new StreamWriter(fileName))
         {
            while (reader.Read())
            {
               var row = new StringBuilder();
               for (var i = 0; i < reader.FieldCount; i++)
               {
                  row.Append(reader.GetValue(i));
                  if (i != reader.FieldCount - 1) row.Append("\t");
               }
               writer.WriteLine(row);
            }
         }
      }

      public void CreateEntityLookup()
      {
         LoadEntityLookup();
         if (Settings.Current.Builder.IsLead)
         {
            var provider = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);
            if (provider != null)
            {
               providerConcepts.Load(provider, provider.Providers[0]);
            }

            SaveEntityLookup(true);
         }

         LoadProviders();
      }

      private void LoadProviders()
      {
         providerConcepts = new EntityLookup<Provider>(Settings.Current.Building.DestinationConnectionString);
         QueryDefinition provider = null;
         if (Settings.Current.Building.DestinationQueryDefinitions != null)
         {
            provider = Settings.Current.Building.DestinationQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);
         }
         else
         {
            provider = Settings.Current.Building.CommonQueryDefinitions.FirstOrDefault(qd => qd.Providers != null);
         }

         if (provider != null)
         {
            providerConcepts.Load(provider, provider.Providers[0]);
         }

         FlushProvidersToCommonVocab();
      }

      public void Initialize()
      {
         var folder = Settings.Current.Builder.Folder;
         lookups = new Dictionary<string, MultiLookup>();
         sourceLookups = new Dictionary<string, SourceLookup>();
         rfLookups = new Dictionary<string, ReferenceFileLookup>();
         genderConcepts = new GenderLookup();
         genderConcepts.Load();

         ingredientLevel = string.IsNullOrEmpty(folder)
            ? new MultiLookup(Settings.Current.Building.VocabularyConnectionString,
               @"Common\Lookups\IngredientLevel.sql")
            : new MultiLookup(Settings.Current.Building.VocabularyConnectionString,
               Path.Combine(folder, @"Common\Lookups\IngredientLevel.sql"));
         ingredientLevel.Load();

         foreach (var qd in Settings.Current.Building.SourceQueryDefinitions)
         {
            if (qd.Persons != null)
            {
               foreach (var d in qd.Persons)
               {
                  d.Vocabulary = this;
               }
            }
            Load(folder, qd.ConditionOccurrence);
            Load(folder, qd.DrugExposure);
            Load(folder, qd.ProcedureOccurrence);
            Load(folder, qd.Observation);
            Load(folder, qd.VisitOccurrence);
            Load(folder, qd.CareSites);
            Load(folder, qd.Providers);
            Load(folder, qd.ProcedureCost);
            Load(folder, qd.Death);
         }

         locationConcepts = new EntityLookup<Location>(Settings.Current.Building.DestinationConnectionString);

         var location = Settings.Current.Building.CommonQueryDefinitions.FirstOrDefault(qd => qd.Locations != null);
         if (location != null)
         {
            locationConcepts.Load(location, location.Locations[0]);
         }
      }

      private void FlushProvidersToCommonVocab()
      {
         if (providerConcepts.Lookup.Count > 1)
         {
            var providers = new List<KeyValuePair<string, long>>(providerConcepts.Lookup.Count);
            providers.AddRange(
               providerConcepts.Lookup.Select(value => new KeyValuePair<string, long>(value.Key, value.Value.Id)));

            VocabularyManager.AddProviders(providers.ToArray());
            providers.Clear();
            providerConcepts.Lookup.Clear();
         }
      }

      private void Load(string folder, IEnumerable<EntityDefinition> definitions)
      {
         if (definitions == null) return;

         foreach (var ed in definitions)
         {
            ed.Vocabulary = this;

            if (ed.Concepts == null) continue;

            foreach (var c in ed.Concepts)
            {
               if (!string.IsNullOrEmpty(c.SourceLookup))
               {
                  if (!sourceLookups.ContainsKey(c.SourceLookup))
                  {
                     var lookupFolder = c.SourceLookup;

                     if (!string.IsNullOrEmpty(folder))
                        lookupFolder = Path.Combine(folder, c.SourceLookup);

                     var lookup = new SourceLookup(Settings.Current.Building.VocabularyConnectionString, lookupFolder);

                     lookup.Load();
                     sourceLookups.Add(c.SourceLookup, lookup);
                  }
               }

               if (c.ConceptIdMappers == null) continue;

               foreach (var conceptIdMapper in c.ConceptIdMappers)
               {
                  if (!string.IsNullOrEmpty(conceptIdMapper.Lookup))
                  {
                     if (!lookups.ContainsKey(conceptIdMapper.Lookup))
                     {
                        var lookupFolder = conceptIdMapper.Lookup;

                        if (!string.IsNullOrEmpty(folder))
                           lookupFolder = Path.Combine(folder, conceptIdMapper.Lookup);

                        var lookup = new MultiLookup(Settings.Current.Building.VocabularyConnectionString, lookupFolder);

                        lookup.Load();
                        lookups.Add(conceptIdMapper.Lookup, lookup);
                     }
                  }

                  if (string.IsNullOrEmpty(conceptIdMapper.File)) continue;
                  if (lookups.ContainsKey(conceptIdMapper.File)) continue;

                  var lookupFileLocation = conceptIdMapper.File;
                  if (!string.IsNullOrEmpty(folder))
                  {
                     lookupFileLocation = Path.Combine(folder, conceptIdMapper.File);
                  }

                  var rfLookup = new ReferenceFileLookup(lookupFileLocation);
                  rfLookup.Load();
                  rfLookups.Add(conceptIdMapper.File, rfLookup);
               }
            }
         }
      }

      public int? LookupGender(string genderSourceValue)
      {
         return (int?) genderConcepts.LookupValue(genderSourceValue);
      }

      public int? LookupLocation(string location)
      {
         return (int?) locationConcepts.LookupValue(location);
      }

      public HashSet<long?> LookupIngredientLevel(long conceptId)
      {
         if (conceptId == 0 || ingredientLevel == null) return new HashSet<long?> {conceptId};

         var ingredientLevelConceptIds = ingredientLevel.MultiLookupValue(conceptId.ToString(), null).ToList();
         if (ingredientLevelConceptIds.Count == 1 && ingredientLevelConceptIds[0].ConceptId == 0)
         {
            return new HashSet<long?> {conceptId};
         }

         return ingredientLevelConceptIds.Select(i => i.ConceptId).ToHashSet();
      }

      public int? LookupDaysSupply(string key, string sqlFileDestination)
      {
         if (daysSupplyLookup == null)
         {
            daysSupplyLookup = new DaysSupplyLookup(Settings.Current.Building.SourceConnectionString,
               sqlFileDestination, Settings.Current.Builder.Folder);
            daysSupplyLookup.Load();
         }
         return (int?) daysSupplyLookup.LookupValue(key);
      }

      public List<LookupValue> Lookup(string sourceValue, string key, DateTime eventDate)
      {
         return lookups[key].MultiLookupValue(sourceValue, eventDate).ToList();
      }

      public string LookupSource(string sourceValue, string key)
      {
         return sourceLookups[key].LookupSource(sourceValue);
      }

      public long? ReferenceFileLookup(string key, string sourceValue)
      {
         return rfLookups[key].LookupValue(sourceValue);
      }
   }
}
