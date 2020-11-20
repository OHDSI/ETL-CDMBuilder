using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v5
{
    public class PersonDataReader : IDataReader
    {
        private readonly IEnumerator<Person> _personEnumerator;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public PersonDataReader(List<Person> batch)
        {
            _personEnumerator = batch?.GetEnumerator();
        }

        public bool Read()
        {
            return _personEnumerator.MoveNext();
        }

        public int FieldCount
        {
            get { return 18; }
        }

        public object GetValue(int i)
        {
            switch (i)
            {
                case 0:
                    return _personEnumerator.Current.PersonId;
                case 1:
                    return _personEnumerator.Current.GenderConceptId;
                case 2:
                    return _personEnumerator.Current.YearOfBirth;
                case 3:
                    return _personEnumerator.Current.MonthOfBirth;
                case 4:
                    return _personEnumerator.Current.DayOfBirth;
                case 5:
                    return _personEnumerator.Current.TimeOfBirth ?? null;
                case 6:
                    return _personEnumerator.Current.RaceConceptId;
                case 7:
                    return _personEnumerator.Current.EthnicityConceptId;
                case 8:
                    return _personEnumerator.Current.LocationId;
                case 9:
                    return _personEnumerator.Current.ProviderId == 0 ? null : _personEnumerator.Current.ProviderId;
                case 10:
                    return _personEnumerator.Current.CareSiteId == 0 ? null : _personEnumerator.Current.CareSiteId;
                case 11:
                    return _personEnumerator.Current.PersonSourceValue;
                case 12:
                    return _personEnumerator.Current.GenderSourceValue;
                case 13:
                    return _personEnumerator.Current.GenderSourceConceptId;
                case 14:
                    return _personEnumerator.Current.RaceSourceValue;
                case 15:
                    return _personEnumerator.Current.RaceSourceConceptId;
                case 16:
                    return _personEnumerator.Current.EthnicitySourceValue;
                case 17:
                    return _personEnumerator.Current.EthnicitySourceConceptId;

                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "person_id";
                case 1: return "gender_concept_id";
                case 2: return "year_of_birth";
                case 3: return "month_of_birth";
                case 4: return "day_of_birth";
                case 5: return "birth_datetime";
                case 6: return "race_concept_id";
                case 7: return "ethnicity_concept_id";
                case 8: return "location_id";
                case 9: return "provider_id";
                case 10: return "care_site_id";
                case 11: return "person_source_value";
                case 12: return "gender_source_value";
                case 13: return "gender_source_concept_id";
                case 14: return "race_source_value";
                case 15: return "race_source_concept_id";
                case 16: return "ethnicity_source_value";
                case 17: return "ethnicity_source_concept_id";

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
                    return typeof(int?);
                case 2:
                    return typeof(int?);
                case 3:
                    return typeof(int?);
                case 4:
                    return typeof(int?);
                case 5:
                    return typeof(DateTime);
                case 6:
                    return typeof(int?);
                case 7:
                    return typeof(int?);
                case 8:
                    return typeof(long?);
                case 9:
                    return typeof(long?);
                case 10:
                    return typeof(long?);
                case 11:
                    return typeof(string);
                case 12:
                    return typeof(string);
                case 13:
                    return typeof(int?);
                case 14:
                    return typeof(string);
                case 15:
                    return typeof(int?);
                case 16:
                    return typeof(string);
                case 17:
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
