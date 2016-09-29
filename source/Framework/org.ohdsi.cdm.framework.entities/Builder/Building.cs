using System;
using System.Data;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.entities.Builder
{
   public class Building
   {
      #region Properties
      public int? Id { get; set; }

      public DateTime? CreateDestinationDbStart { get; private set; }
      public DateTime? CreateDestinationDbEnd { get; private set; }
      public DateTime? CreateChunksStart { get; private set; }
      public DateTime? CreateChunksEnd { get; private set; }
      public DateTime? CreateLookupStart { get; private set; }
      public DateTime? CreateLookupEnd { get; private set; }
      public DateTime? BuildingStart { get; private set; }
      public DateTime? BuildingEnd { get; private set; }
      public DateTime? CopyVocabularyStart { get; private set; }
      public DateTime? CopyVocabularyEnd { get; private set; }
      public DateTime? CreateIndexesStart { get; private set; }
      public DateTime? CreateIndexesEnd { get; private set; }
      public DateTime? AchillesStart { get; private set; }
      public DateTime? AchillesEnd { get; private set; }

      public bool DestinationStarted
      {
         get
         {
            if (DestinationCreated)
               return false;

            if (!CreateDestinationDbStart.HasValue)
               return false;

            return CreateDestinationDbStart.Value != DateTime.MinValue;
         }
      }

      public bool DestinationCreated
      {
         get
         {
            if (!CreateDestinationDbEnd.HasValue)
               return false;

            return CreateDestinationDbEnd.Value != DateTime.MinValue;
         }
      }

      public bool ChunksStarted
      {
         get
         {
            if (ChunksCreated)
               return false;

            if (!CreateChunksStart.HasValue)
               return false;

            return CreateChunksStart.Value != DateTime.MinValue;
         }
      }

      public bool ChunksCreated
      {
         get
         {
            if (!CreateChunksEnd.HasValue)
               return false;

            return CreateChunksEnd.Value != DateTime.MinValue;
         }
      }

      public bool LookupStarted
      {
         get
         {
            if (LookupCreated)
               return false;

            if (!CreateLookupStart.HasValue)
               return false;

            return CreateLookupStart.Value != DateTime.MinValue;
         }
      }


      public bool LookupCreated
      {
         get
         {
            if (!CreateLookupEnd.HasValue)
               return false;

            return CreateLookupEnd.Value != DateTime.MinValue;
         }
      }

      public bool BuildingStarted
      {
         get
         {
            if (!BuildingStart.HasValue)
               return false;

            return BuildingStart.Value != DateTime.MinValue;
         }
      }

      public bool BuildingComplete
      {
         get
         {
            if (!BuildingEnd.HasValue)
               return false;

            return BuildingEnd.Value != DateTime.MinValue;
         }
      }

      public bool IndexesStarted
      {
         get
         {
            if (IndexesCreated)
               return false;

            if (!CreateIndexesStart.HasValue)
               return false;

            return CreateIndexesStart.Value != DateTime.MinValue;
         }
      }

      public bool IndexesCreated
      {
         get
         {
            if (!CreateIndexesEnd.HasValue)
               return false;

            return CreateIndexesEnd.Value != DateTime.MinValue;
         }
      }


      public bool VocabularyStarted
      {
         get
         {
            if (VocabularyCopied)
               return false;

            if (!CopyVocabularyStart.HasValue)
               return false;

            return CopyVocabularyStart.Value != DateTime.MinValue;
         }
      }

      public bool VocabularyCopied
      {
         get
         {
            if (!CopyVocabularyEnd.HasValue)
               return false;

            return CopyVocabularyEnd.Value != DateTime.MinValue;
         }
      }

      public bool AchillesStarted
      {
         get
         {
            if (AchillesFinished)
               return false;

            if (!AchillesStart.HasValue)
               return false;

            return AchillesStart.Value != DateTime.MinValue;
         }
      }

      public bool AchillesFinished
      {
         get
         {
            if (!AchillesEnd.HasValue)
               return false;

            return AchillesEnd.Value != DateTime.MinValue;
         }
      }
      #endregion

      #region Methods
      public void SetFrom(IDataReader reader)
      {
         Id = reader.GetInt("Id");

         CreateDestinationDbStart = reader.GetDateTime("CreateDestinationDbStart");
         CreateDestinationDbEnd = reader.GetDateTime("CreateDestinationDbEnd");
         CreateChunksStart = reader.GetDateTime("CreateChunksStart");
         CreateChunksEnd = reader.GetDateTime("CreateChunksEnd");
         CreateLookupStart = reader.GetDateTime("CreateLookupStart");
         CreateLookupEnd = reader.GetDateTime("CreateLookupEnd");
         BuildingStart = reader.GetDateTime("BuildingStart");
         BuildingEnd = reader.GetDateTime("BuildingEnd");
         CopyVocabularyStart = reader.GetDateTime("CopyVocabularyStart");
         CopyVocabularyEnd = reader.GetDateTime("CopyVocabularyEnd");
         CreateIndexesStart = reader.GetDateTime("CreateIndexesStart");
         CreateIndexesEnd = reader.GetDateTime("CreateIndexesEnd");
         AchillesStart = reader.GetDateTime("AchillesStart");
         AchillesEnd = reader.GetDateTime("AchillesEnd");
      }
      #endregion
   }
}
