using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v6
{
    public class CohortDefinitionDataReader : IDataReader
    {
        private readonly IEnumerator<CohortDefinition> _cohortEnumerator;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public CohortDefinitionDataReader(List<CohortDefinition> batch)
        {
            _cohortEnumerator = batch?.GetEnumerator();
        }

        public bool Read()
        {
            return _cohortEnumerator.MoveNext();
        }

        public int FieldCount
        {
            get { return 7; }
        }

        // is this called only because the datatype specific methods are not implemented?  
        // probably performance to be gained by not passing object back?
        public object GetValue(int i)
        {
            switch (i)
            {
                case 0:
                    return _cohortEnumerator.Current.Id;
                case 1:
                    return _cohortEnumerator.Current.Name;
                case 2:
                    return _cohortEnumerator.Current.Description;
                case 3:
                    return _cohortEnumerator.Current.TypeConceptId;
                case 4:
                    return _cohortEnumerator.Current.Syntax;
                case 5:
                    return _cohortEnumerator.Current.ConceptId;
                case 6:
                    return _cohortEnumerator.Current.Date;

                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "cohort_definition_id";
                case 1: return "cohort_definition_name";
                case 2: return "cohort_definition_description";
                case 3: return "definition_type_concept_id";
                case 4: return "cohort_definition_syntax";
                case 5: return "subject_concept_id";
                case 6: return "cohort_initiation_date";

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
                    return typeof(int);
                case 4:
                    return typeof(string);
                case 5:
                    return typeof(int);
                case 6:
                    return typeof(DateTime);

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
