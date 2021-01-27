using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v6
{
    public class VisitOccurrenceDataReader : IDataReader
    {
        private readonly IEnumerator<VisitOccurrence> _enumerator;
        private readonly KeyMasterOffsetManager _offset;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public VisitOccurrenceDataReader(List<VisitOccurrence> batch, KeyMasterOffsetManager o)
        {
            _enumerator = batch?.GetEnumerator();
            _offset = o;
        }

        public bool Read()
        {
            return _enumerator.MoveNext();
        }

        public int FieldCount
        {
            get { return 17; }
        }

        // is this called only because the datatype specific methods are not implemented?  
        // probably performance to be gained by not passing object back?
        public object GetValue(int i)
        {
            switch (i)
            {
                case 0:
                    {
                        return _offset.GetKeyOffset(_enumerator.Current.PersonId).VisitOccurrenceIdChanged
                            ? _offset.GetId(_enumerator.Current.PersonId, _enumerator.Current.Id)
                            : _enumerator.Current.Id;
                    }
                case 1:
                    return _enumerator.Current.PersonId;
                case 2:
                    return _enumerator.Current.ConceptId;
                case 3:
                    return _enumerator.Current.StartDate;
                case 4:
                    return _enumerator.Current.StartDate;
                case 5:
                    return _enumerator.Current.EndDate;
                case 6:
                    return _enumerator.Current.EndDate;
                case 7:
                    return _enumerator.Current.TypeConceptId;
                case 8:
                    return _enumerator.Current.ProviderId == 0 ? null : _enumerator.Current.ProviderId;
                case 9:
                    return _enumerator.Current.CareSiteId == 0 ? null : _enumerator.Current.CareSiteId;
                case 10:
                    return _enumerator.Current.SourceValue;
                case 11:
                    return _enumerator.Current.SourceConceptId;
                case 12:
                    return _enumerator.Current.AdmittingSourceConceptId;
                case 13:
                    return _enumerator.Current.AdmittingSourceValue;
                case 14:
                    return _enumerator.Current.DischargeToSourceValue;
                case 15:
                    return _enumerator.Current.DischargeToConceptId;
                case 16:
                    if (_enumerator.Current.PrecedingVisitOccurrenceId.HasValue)
                    {
                        if (_offset.GetKeyOffset(_enumerator.Current.PersonId).VisitOccurrenceIdChanged)
                            return _offset.GetId(_enumerator.Current.PersonId,
                                _enumerator.Current.PrecedingVisitOccurrenceId.Value);

                        return _enumerator.Current.PrecedingVisitOccurrenceId;
                    }

                    return _enumerator.Current.PrecedingVisitOccurrenceId;

                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "visit_occurrence_id";
                case 1: return "person_id";
                case 2: return "visit_concept_id";
                case 3: return "visit_start_date";
                case 4: return "visit_start_datetime";
                case 5: return "visit_end_date";
                case 6: return "visit_end_datetime";
                case 7: return "visit_type_concept_id";
                case 8: return "provider_id";
                case 9: return "care_site_id";
                case 10: return "visit_source_value";
                case 11: return "visit_source_concept_id";
                case 12: return "admitted_from_concept_id";
                case 13: return "admitted_from_source_value";
                case 14: return "discharge_to_source_value";
                case 15: return "discharge_to_concept_id";
                case 16: return "preceding_visit_occurrence_id";
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
                case 0: return typeof(long);
                case 1: return typeof(long);
                case 2: return typeof(int);
                case 3: return typeof(DateTime?);
                case 4: return typeof(DateTime);
                case 5: return typeof(DateTime?);
                case 6: return typeof(DateTime);
                case 7: return typeof(int);
                case 8: return typeof(long?);
                case 9: return typeof(long?);
                case 10: return typeof(string);
                case 11: return typeof(int);
                case 12: return typeof(int);
                case 13: return typeof(string);
                case 14: return typeof(string);
                case 15: return typeof(int);
                case 16: return typeof(long?);

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
