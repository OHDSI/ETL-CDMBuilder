using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v5
{
    public class CdmSourceDataReader : IDataReader
    {
        private readonly IEnumerator<CdmSource> _enumerator;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public CdmSourceDataReader()
        {
            _enumerator = new List<CdmSource> { new CdmSource() }.GetEnumerator();
        }

        public CdmSourceDataReader(string sourceReleaseDate, string vocabularyVersion)
        {
            _enumerator = new List<CdmSource>
            {
                new CdmSource() {SourceReleaseDate = sourceReleaseDate, VocabularyVersion = vocabularyVersion}
            }.GetEnumerator();
        }

        public bool Read()
        {
            return _enumerator.MoveNext();
        }

        public int FieldCount
        {
            get { return 10; }
        }

        public object GetValue(int i)
        {
            if (_enumerator.Current == null) return null;

            switch (i)
            {
                case 0:
                    return _enumerator.Current.CdmSourceName;
                case 1:
                    return _enumerator.Current.CdmSourceAbbreviation;
                case 2:
                    return _enumerator.Current.CdmHolder;
                case 3:
                    return _enumerator.Current.SourceDescription;
                case 4:
                    return _enumerator.Current.SourceDocumentationReference;
                case 5:
                    return _enumerator.Current.CdmEtlReference;
                case 6:
                    return _enumerator.Current.SourceReleaseDate;
                case 7:
                    return _enumerator.Current.CdmReleaseDate;
                case 8:
                    return _enumerator.Current.CdmVersion;
                case 9:
                    return _enumerator.Current.VocabularyVersion;

                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "cdm_source_name";
                case 1: return "cdm_source_abbreviation";
                case 2: return "cdm_holder";
                case 3: return "source_description";
                case 4: return "source_documentation_reference";
                case 5: return "cdm_etl_reference";
                case 6: return "source_release_date";
                case 7: return "cdm_release_date";
                case 8: return "cdm_version";
                case 9: return "vocabulary_version";
                default:
                    throw new NotImplementedException();
            }
        }

        #region implementationn not required for SqlBulkCopy

        public bool NextResult()
        {
            throw new NotImplementedException();
        }

        public void Close()
        {
            throw new NotImplementedException();
        }

        public bool IsClosed
        {
            get { throw new NotImplementedException(); }
        }

        public int Depth
        {
            get { throw new NotImplementedException(); }
        }

        public DataTable GetSchemaTable()
        {
            throw new NotImplementedException();
        }

        public int RecordsAffected
        {
            get { throw new NotImplementedException(); }
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public bool GetBoolean(int i)
        {
            return (bool)GetValue(i);
        }

        public byte GetByte(int i)
        {
            return (byte)GetValue(i);
        }

        public long GetBytes(int i, long fieldOffset, byte[] buffer, int bufferoffset, int length)
        {
            throw new NotImplementedException();
        }

        public char GetChar(int i)
        {
            return (char)GetValue(i);
        }

        public long GetChars(int i, long fieldoffset, char[] buffer, int bufferoffset, int length)
        {
            throw new NotImplementedException();
        }

        public IDataReader GetData(int i)
        {
            throw new NotImplementedException();
        }

        public string GetDataTypeName(int i)
        {
            throw new NotImplementedException();
        }

        public DateTime GetDateTime(int i)
        {
            return (DateTime)GetValue(i);
        }

        public decimal GetDecimal(int i)
        {
            return (decimal)GetValue(i);
        }

        public double GetDouble(int i)
        {
            return Convert.ToDouble(GetValue(i));
        }

        public Type GetFieldType(int i)
        {
            switch (i)
            {
                case 0:
                    return typeof(string);
                case 1:
                    return typeof(string);
                case 2:
                    return typeof(string);
                case 3:
                    return typeof(string);
                case 4:
                    return typeof(string);
                case 5:
                    return typeof(string);
                case 6:
                    return typeof(string);
                case 7:
                    return typeof(string);
                case 8:
                    return typeof(string);
                case 9:
                    return typeof(string);
                default:
                    throw new NotImplementedException();
            }
        }

        public float GetFloat(int i)
        {
            return (float)GetValue(i);
        }

        public Guid GetGuid(int i)
        {
            return (Guid)GetValue(i);
        }

        public short GetInt16(int i)
        {
            return (short)GetValue(i);
        }

        public int GetInt32(int i)
        {
            return (int)GetValue(i);
        }

        public long GetInt64(int i)
        {
            return Convert.ToInt64(GetValue(i));
        }

        public int GetOrdinal(string name)
        {
            throw new NotImplementedException();
        }

        public string GetString(int i)
        {
            return (string)GetValue(i);
        }

        public int GetValues(object[] values)
        {
            var cnt = 0;
            for (var i = 0; i < FieldCount; i++)
            {
                values[i] = GetValue(i);
                cnt++;
            }

            return cnt;
        }

        public bool IsDBNull(int i)
        {
            return GetValue(i) == null;
        }

        public object this[string name]
        {
            get { throw new NotImplementedException(); }
        }

        public object this[int i]
        {
            get { throw new NotImplementedException(); }
        }

        #endregion
    }
}
