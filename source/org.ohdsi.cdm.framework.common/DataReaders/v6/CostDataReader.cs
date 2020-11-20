using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v6
{
    public class CostDataReader : IDataReader
    {
        private readonly IEnumerator<Cost> _enumerator;
        private readonly KeyMasterOffsetManager _offset;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public CostDataReader(List<Cost> batch, KeyMasterOffsetManager o)
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
            get { return 18; }
        }

        public object GetValue(int i)
        {
            if (_enumerator.Current == null) return null;

            switch (i)
            {
                case 0:

                    return _offset.GetId(_enumerator.Current.PersonId,
                        _enumerator.Current.CostId); //TODO VisitCostOffset -> CostOffset

                case 1:
                    return _enumerator.Current.PersonId;

                case 2:
                    if (_enumerator.Current.Domain == "Visit" && !_offset
                            .GetKeyOffset(_enumerator.Current.PersonId).VisitOccurrenceIdChanged)
                        return _enumerator.Current.EventId;

                    return _offset.GetId(_enumerator.Current.PersonId, _enumerator.Current.EventId);

                case 3:
                    return _enumerator.Current.EventFieldConceptId;

                case 4:
                    return _enumerator.Current.CostConceptId;

                case 5:
                    return _enumerator.Current.TypeId;

                case 6:
                    return _enumerator.Current.CurrencyConceptId;

                case 7:
                    return _enumerator.Current.CostValue.Round();

                case 8:
                    return _enumerator.Current.IncurredDate;

                case 9:
                    return _enumerator.Current.BilledDate;

                case 10:
                    return _enumerator.Current.PaidDate;

                case 11:
                    return _enumerator.Current.RevenueCodeConceptId;

                case 12:
                    return _enumerator.Current.DrgConceptId;

                case 13:
                    return _enumerator.Current.SourceValue;

                case 14:
                    return _enumerator.Current.SourceConceptId;

                case 15:
                    return _enumerator.Current.RevenueCodeSourceValue;

                case 16:
                    return _enumerator.Current.DrgSourceValue;

                case 17:
                    return _enumerator.Current.PayerPlanPeriodId.HasValue
                        ? _offset.GetId(_enumerator.Current.PersonId,
                            _enumerator.Current.PayerPlanPeriodId.Value)
                        : _enumerator.Current.PayerPlanPeriodId;

                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "cost_id";
                case 1: return "person_id";
                case 2: return "cost_event_id";
                case 3: return "cost_event_field_concept_id";
                case 4: return "cost_concept_id";
                case 5: return "cost_type_concept_id";
                case 6: return "currency_concept_id";
                case 7: return "cost";
                case 8: return "incurred_date";
                case 9: return "billed_date";
                case 10: return "paid_date";
                case 11: return "revenue_code_concept_id";
                case 12: return "drg_concept_id";
                case 13: return "cost_source_value";
                case 14: return "cost_source_concept_id";
                case 15: return "revenue_code_source_value";
                case 16: return "drg_source_value";
                case 17: return "payer_plan_period_id";

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
                case 2: return typeof(long);
                case 3: return typeof(int);
                case 4: return typeof(int);
                case 5: return typeof(int);
                case 6: return typeof(int);
                case 7: return typeof(decimal?);
                case 8: return typeof(DateTime);
                case 9: return typeof(DateTime?);
                case 10: return typeof(DateTime?);
                case 11: return typeof(int);
                case 12: return typeof(int);
                case 13: return typeof(string);
                case 14: return typeof(int);
                case 15: return typeof(string);
                case 16: return typeof(string);
                case 17: return typeof(long?);

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
