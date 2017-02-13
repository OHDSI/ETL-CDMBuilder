using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using org.ohdsi.cdm.framework.core.Common.Services;
using org.ohdsi.cdm.framework.core.Databases;
using org.ohdsi.cdm.framework.core.Definitions;
using org.ohdsi.cdm.framework.core.Lookups;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Attributes;
using org.ohdsi.cdm.framework.shared.Extensions;

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
      
      private void LoadEntityLookup()
      {
         var connection = Settings.Current.Building.SourceConnectionString;
         var queryDefinitions = Settings.Current.Building.SourceQueryDefinitions;
         var schemaName = Settings.Current.Building.SourceSchemaName;

         locationConcepts = new EntityLookup<Location>(connection, schemaName);
         organizationConcepts = new EntityLookup<Organization>(connection, schemaName);
         careSiteConcepts = new EntityLookup<CareSite>(connection, schemaName);
         providerConcepts = new EntityLookup<Provider>(connection, schemaName);

         var location = queryDefinitions.FirstOrDefault(qd => qd.Locations != null && qd.IsSuitable(qd.Query.Database, Settings.Current.Building.Vendor));
         if (location != null)
         {
            locationConcepts.Load(location, location.Locations[0]);
         }

         if (locationConcepts.Lookup.Count == 0)
            locationConcepts.Lookup.Add("0", new Location {Id = 1});

         var organization = queryDefinitions.FirstOrDefault(qd => qd.Organizations != null && qd.IsSuitable(qd.Query.Database, Settings.Current.Building.Vendor));
         if (organization != null)
         {
            organizationConcepts.Load(organization, organization.Organizations[0]);
         }

         if (organizationConcepts.Lookup.Count == 0)
            organizationConcepts.Lookup.Add("0",
               new Organization {Id = 0, LocationId = 0, ConceptId = 0, SourceValue = string.Empty});

         var careSite = queryDefinitions.FirstOrDefault(qd => qd.CareSites != null && qd.IsSuitable(qd.Query.Database, Settings.Current.Building.Vendor));
         if (careSite != null)
         {
            careSiteConcepts.Load(careSite, careSite.CareSites[0]);
         }

         if (careSiteConcepts.Lookup.Count == 0)
            careSiteConcepts.Lookup.Add("0",
               new CareSite {Id = 0, LocationId = 0, OrganizationId = 0, PlaceOfSvcSourceValue = null});
      }

      public void CreateEntityLookup(bool lookupCreated)
      {
         LoadEntityLookup();
         if (Settings.Current.Builder.IsLead && !lookupCreated)
         {
            var provider = Settings.Current.Building.SourceQueryDefinitions.FirstOrDefault(qd => qd.Providers != null && qd.IsSuitable(qd.Query.Database, Settings.Current.Building.Vendor));
            if (provider != null)
            {
               providerConcepts.Load(provider, provider.Providers[0]);
            }

            var saver = Settings.Current.Building.DestinationEngine.GetSaver();
            using (saver.Create(Settings.Current.Building.DestinationConnectionString))
            {
                saver.SaveEntityLookup(locationConcepts.Lookup.Values.ToList(), organizationConcepts.Lookup.Values.ToList(),
                   careSiteConcepts.Lookup.Values.ToList(), providerConcepts.Lookup.Values.ToList());
            }

            if (Settings.Current.StoreToAPS)
            {
               var aps = new APSDatabaseEngine();
               var apsSaver = aps.GetSaver();
               using (apsSaver.Create(Settings.Current.APSConnectionString))
               {
                  apsSaver.SaveEntityLookup(locationConcepts.Lookup.Values.ToList(),
                     organizationConcepts.Lookup.Values.ToList(),
                     careSiteConcepts.Lookup.Values.ToList(), providerConcepts.Lookup.Values.ToList());
               }
            }

         }

         LoadProviders();
      }

      private void LoadProviders()
      {
         providerConcepts = new EntityLookup<Provider>(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);
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

         var ingredientLevelFile = Settings.Current.Building.CDM.GetAttribute<IngredientLevelFileAttribute>().Value;
         var vendorIngredientLevelFile =
            Settings.Current.Building.Vendor.GetAttribute<IngredientLevelFileAttribute>();

         if (vendorIngredientLevelFile != null)
            ingredientLevelFile = vendorIngredientLevelFile.Value;

         ingredientLevel = string.IsNullOrEmpty(folder)
            ? new MultiLookup(Settings.Current.Building.VocabularyConnectionString,
               @"Common\Lookups\" + ingredientLevelFile, Settings.Current.Building.VocabularySchemaName)
            : new MultiLookup(Settings.Current.Building.VocabularyConnectionString,
               Path.Combine(folder, @"Common\Lookups\" + ingredientLevelFile), Settings.Current.Building.VocabularySchemaName);
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
            Load(folder, qd.DeviceCost);
            Load(folder, qd.ObservationCost);
            Load(folder, qd.MeasurementCost);
            Load(folder, qd.DrugCost);
            Load(folder, qd.Death);
            Load(folder, qd.Measurement);
            Load(folder, qd.DeviceExposure);
         }
        
         locationConcepts = new EntityLookup<Location>(Settings.Current.Building.DestinationConnectionString, Settings.Current.Building.DestinationSchemaName);

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

            ServicesManager.AddProviders(providers.ToArray());
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

                     var lookup = new SourceLookup(Settings.Current.Building.VocabularyConnectionString, lookupFolder, Settings.Current.Building.VocabularySchemaName);

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

                        var lookup = new MultiLookup(GetConnectionString(lookupFolder), lookupFolder, GetSchemaName(lookupFolder));

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

                  if (!rfLookups.ContainsKey(conceptIdMapper.File))
                  {
                     var rfLookup = new ReferenceFileLookup(lookupFileLocation);
                     rfLookup.Load();
                     rfLookups.Add(conceptIdMapper.File, rfLookup);
                  }
               }

               if (c.SourceConceptIdMappers != null)
               {
                   foreach (var conceptIdMapper in c.SourceConceptIdMappers)
                   {
                       if (!string.IsNullOrEmpty(conceptIdMapper.Lookup))
                       {
                           if (!lookups.ContainsKey(conceptIdMapper.Lookup))
                           {
                               var lookupFolder = conceptIdMapper.Lookup;

                               if (!string.IsNullOrEmpty(folder))
                                   lookupFolder = Path.Combine(folder, conceptIdMapper.Lookup);

                               var lookup = new MultiLookup(GetConnectionString(lookupFolder), lookupFolder, GetSchemaName(lookupFolder));

                               lookup.Load();
                               lookups.Add(conceptIdMapper.Lookup, lookup);
                           }
                       }
                   }
               }
            }
         }
      }

      private static string GetConnectionString(string lookupFolder)
      {
         var info = Directory.GetParent(lookupFolder);
         var connectionString = Settings.Current.Building.VocabularyConnectionString;
         if (info.Name == "Source")
            connectionString = Settings.Current.Building.SourceConnectionString;
         return connectionString;
      }

      private static string GetSchemaName(string lookupFolder)
      {
         var info = Directory.GetParent(lookupFolder);
         var sn = Settings.Current.Building.VocabularySchemaName;
         if (info.Name == "Source")
            sn = Settings.Current.Building.SourceSchemaName;
         return sn;
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
               sqlFileDestination, Settings.Current.Builder.Folder, Settings.Current.Building.SourceSchemaName);
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
