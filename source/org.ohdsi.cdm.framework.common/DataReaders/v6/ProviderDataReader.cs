using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v6
{
    public class ProviderDataReader : IDataReader
    {
        private readonly IEnumerator<Provider> _enumerator;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public ProviderDataReader(List<Provider> batch)
        {
            _enumerator = batch?.GetEnumerator();
        }

        public bool Read()
        {
            return _enumerator.MoveNext();
        }

        public int FieldCount
        {
            get { return 13; }
        }

        public object GetValue(int i)
        {
            if (_enumerator.Current == null) return null;

            switch (i)
            {
                case 0:
                    return _enumerator.Current.Id;

                case 1:
                    return _enumerator.Current.Name;

                case 2:
                    return _enumerator.Current.Npi;

                case 3:
                    return _enumerator.Current.Dea;

                case 4:
                    return _enumerator.Current.ConceptId; //SPECIALTY_CONCEPT_ID

                case 5:
                    return _enumerator.Current.CareSiteId == 0 ? null : _enumerator.Current.CareSiteId;

                case 6:
                    return _enumerator.Current.YearOfBirth;

                case 7:
                    return _enumerator.Current.GenderConceptId;

                case 8:
                    return _enumerator.Current.ProviderSourceValue;

                case 9:
                    return _enumerator.Current.SourceValue; //SPECIALTY_SOURCE_VALUE

                case 10:
                    return _enumerator.Current.SpecialtySourceConceptId;

                case 11:
                    return _enumerator.Current.GenderSourceValue;

                case 12:
                    return _enumerator.Current.GenderSourceConceptId;

                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "provider_id";
                case 1: return "provider_name";
                case 2: return "npi";
                case 3: return "dea";
                case 4: return "specialty_concept_id";
                case 5: return "care_site_id";
                case 6: return "year_of_birth";
                case 7: return "gender_concept_id";
                case 8: return "provider_source_value";
                case 9: return "specialty_source_value";
                case 10: return "specialty_source_concept_id";
                case 11: return "gender_source_value";
                case 12: return "gender_source_concept_id";

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
                    return typeof(long);

                case 1:
                    return typeof(string);

                case 2:
                    return typeof(string);

                case 3:
                    return typeof(string);

                case 4:
                    return typeof(int);

                case 5:
                    return typeof(long?);

                case 6:
                    return typeof(int?);

                case 7:
                    return typeof(int?);

                case 8:
                    return typeof(string);

                case 9:
                    return typeof(string);

                case 10:
                    return typeof(int?);

                case 11:
                    return typeof(string);

                case 12:
                    return typeof(int?);

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
