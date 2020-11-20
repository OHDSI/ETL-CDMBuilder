using System;
using System.Xml.Serialization;

namespace org.ohdsi.cdm.presentation.builder
{
    public class Building
    {
        #region Properties

        public DateTime? CreateDestinationDbStart { get; set; }
        public DateTime? CreateDestinationDbEnd { get; set; }
        public DateTime? CreateChunksStart { get; set; }
        public DateTime? CreateChunksEnd { get; set; }
        public DateTime? CreateLookupStart { get; set; }
        public DateTime? CreateLookupEnd { get; set; }
        public DateTime? BuildingStart { get; set; }
        public DateTime? BuildingEnd { get; set; }
        public DateTime? CopyVocabularyStart { get; set; }
        public DateTime? CopyVocabularyEnd { get; set; }
        public DateTime? CreateIndexesStart { get; set; }
        public DateTime? CreateIndexesEnd { get; set; }
        public DateTime? PostprocessStart { get; set; }
        public DateTime? PostprocessEnd { get; set; }

        [XmlIgnore]
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

        [XmlIgnore]
        public bool DestinationCreated
        {
            get
            {
                if (!CreateDestinationDbEnd.HasValue)
                    return false;

                return CreateDestinationDbEnd.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
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

        [XmlIgnore]
        public bool ChunksCreated
        {
            get
            {
                if (!CreateChunksEnd.HasValue)
                    return false;

                return CreateChunksEnd.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
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

        [XmlIgnore]
        public bool LookupCreated
        {
            get
            {
                if (!CreateLookupEnd.HasValue)
                    return false;

                return CreateLookupEnd.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
        public bool BuildingStarted
        {
            get
            {
                if (!BuildingStart.HasValue)
                    return false;

                return BuildingStart.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
        public bool BuildingComplete
        {
            get
            {
                if (!BuildingEnd.HasValue)
                    return false;

                return BuildingEnd.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
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

        [XmlIgnore]
        public bool IndexesCreated
        {
            get
            {
                if (!CreateIndexesEnd.HasValue)
                    return false;

                return CreateIndexesEnd.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
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

        [XmlIgnore]
        public bool VocabularyCopied
        {
            get
            {
                if (!CopyVocabularyEnd.HasValue)
                    return false;

                return CopyVocabularyEnd.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
        public bool PostprocessStarted
        {
            get
            {
                if (PostprocessFinished)
                    return false;

                if (!PostprocessStart.HasValue)
                    return false;

                return PostprocessStart.Value != DateTime.MinValue;
            }
        }

        [XmlIgnore]
        public bool PostprocessFinished
        {
            get
            {
                if (!PostprocessEnd.HasValue)
                    return false;

                return PostprocessEnd.Value != DateTime.MinValue;
            }
        }

        #endregion
    }
}
