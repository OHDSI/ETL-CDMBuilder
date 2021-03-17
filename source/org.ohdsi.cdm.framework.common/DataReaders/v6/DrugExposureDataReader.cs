using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v6
{
    public class DrugExposureDataReader : IDataReader
    {
        private readonly IEnumerator<DrugExposure> _enumerator;
        private readonly KeyMasterOffsetManager _offset;


        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public DrugExposureDataReader(List<DrugExposure> batch, KeyMasterOffsetManager o)
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
            get { return 23; }
        }

        public object GetValue(int i)
        {
            if (_enumerator.Current == null) return null;

            switch (i)
            {
                case 0:
                    return _offset.GetId(_enumerator.Current.PersonId, _enumerator.Current.Id);
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
                    return _enumerator.Current.VerbatimEndDate;
                case 8:
                    return _enumerator.Current.TypeConceptId;
                case 9:
                    return _enumerator.Current.StopReason;
                case 10:
                    return _enumerator.Current.Refills;
                case 11:
                    return _enumerator.Current.Quantity;
                case 12:
                    return _enumerator.Current.DaysSupply;
                case 13:
                    return _enumerator.Current.Sig;
                case 14:
                    return _enumerator.Current.RouteConceptId;
                case 15:
                    return _enumerator.Current.LotNumber;
                case 16:
                    return _enumerator.Current.ProviderId == 0 ? null : _enumerator.Current.ProviderId;
                case 17:
                    if (_enumerator.Current.VisitOccurrenceId.HasValue)
                    {
                        if (_offset.GetKeyOffset(_enumerator.Current.PersonId).VisitOccurrenceIdChanged)
                            return _offset.GetId(_enumerator.Current.PersonId,
                                _enumerator.Current.VisitOccurrenceId.Value);

                        return _enumerator.Current.VisitOccurrenceId.Value;
                    }

                    return null;
                case 18:
                    if (_enumerator.Current.VisitDetailId.HasValue)
                    {
                        if (_offset.GetKeyOffset(_enumerator.Current.PersonId).VisitDetailIdChanged)
                            return _offset.GetId(_enumerator.Current.PersonId,
                                _enumerator.Current.VisitDetailId.Value);

                        return _enumerator.Current.VisitDetailId;
                    }

                    return null;
                case 19:
                    return _enumerator.Current.SourceValue;
                case 20:
                    return _enumerator.Current.SourceConceptId;
                case 21:
                    return _enumerator.Current.RouteSourceValue;
                case 22:
                    return _enumerator.Current.DoseUnitSourceValue;
                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "drug_exposure_id";
                case 1: return "person_id";
                case 2: return "drug_concept_id";
                case 3: return "drug_exposure_start_date";
                case 4: return "drug_exposure_start_datetime";
                case 5: return "drug_exposure_end_date";
                case 6: return "drug_exposure_end_datetime";
                case 7: return "verbatim_end_date";
                case 8: return "drug_type_concept_id";
                case 9: return "stop_reason";
                case 10: return "refills";
                case 11: return "quantity";
                case 12: return "days_supply";
                case 13: return "sig";
                case 14: return "route_concept_id";
                case 15: return "lot_number";
                case 16: return "provider_id";
                case 17: return "visit_occurrence_id";
                case 18: return "visit_detail_id";
                case 19: return "drug_source_value";
                case 20: return "drug_source_concept_id";
                case 21: return "route_source_value";
                case 22: return "dose_unit_source_value";
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
                case 7: return typeof(DateTime?);
                case 8: return typeof(int);
                case 9: return typeof(string);
                case 10: return typeof(int?);
                case 11: return typeof(decimal?);
                case 12: return typeof(int?);
                case 13: return typeof(string);
                case 14: return typeof(int);
                case 15: return typeof(string);
                case 16: return typeof(long?);
                case 17: return typeof(long?);
                case 18: return typeof(long?);
                case 19: return typeof(string);
                case 20: return typeof(int);
                case 21: return typeof(string);
                case 22: return typeof(string);

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
