using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v6
{
    public class PayerPlanPeriodDataReader : IDataReader
    {
        private readonly IEnumerator<PayerPlanPeriod> _enumerator;
        private readonly KeyMasterOffsetManager _offset;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public PayerPlanPeriodDataReader(List<PayerPlanPeriod> batch, KeyMasterOffsetManager o)
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
            get { return 21; }
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
                    return _enumerator.Current.ContractPersonId;

                case 3:
                    return _enumerator.Current.StartDate;

                case 4:
                    return _enumerator.Current.EndDate;

                case 5:
                    return _enumerator.Current.PayerConceptId;

                case 6:
                    return _enumerator.Current.PlanConceptId;

                case 7:
                    return _enumerator.Current.ContractConceptId;

                case 8:
                    return _enumerator.Current.SponsorConceptId;

                case 9:
                    return _enumerator.Current.StopReasonConceptId;

                case 10:
                    return _enumerator.Current.PayerSourceValue;

                case 11:
                    return _enumerator.Current.PayerSourceConceptId;

                case 12:
                    return _enumerator.Current.PlanSourceValue;

                case 13:
                    return _enumerator.Current.PlanSourceConceptId;

                case 14:
                    return _enumerator.Current.ContractSourceValue;

                case 15:
                    return _enumerator.Current.ContractSourceConceptId;

                case 16:
                    return _enumerator.Current.SponsorSourceValue;

                case 17:
                    return _enumerator.Current.SponsorSourceConceptId;

                case 18:
                    return _enumerator.Current.FamilySourceValue;

                case 19:
                    return _enumerator.Current.StopReasonSourceValue;

                case 20:
                    return _enumerator.Current.StopReasonSourceConceptId;

                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0: return "payer_plan_period_id";
                case 1: return "person_id";
                case 2: return "contract_person_id";
                case 3: return "payer_plan_period_start_date";
                case 4: return "payer_plan_period_end_date";
                case 5: return "payer_concept_id";
                case 6: return "plan_concept_id";
                case 7: return "contract_concept_id";
                case 8: return "sponsor_concept_id";
                case 9: return "stop_reason_concept_id";
                case 10: return "payer_source_value";
                case 11: return "payer_source_concept_id";
                case 12: return "plan_source_value";
                case 13: return "plan_source_concept_id";
                case 14: return "contract_source_value";
                case 15: return "contract_source_concept_id";
                case 16: return "sponsor_source_value";
                case 17: return "sponsor_source_concept_id";
                case 18: return "family_source_value";
                case 19: return "stop_reason_source_value";
                case 20: return "stop_reason_source_concept_id";

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
                case 2: return typeof(long?);
                case 3: return typeof(DateTime);
                case 4: return typeof(DateTime);
                case 5: return typeof(int);
                case 6: return typeof(int);
                case 7: return typeof(int);
                case 8: return typeof(int);
                case 9: return typeof(int);
                case 10: return typeof(string);
                case 11: return typeof(int);
                case 12: return typeof(string);
                case 13: return typeof(int);
                case 14: return typeof(string);
                case 15: return typeof(int);
                case 16: return typeof(string);
                case 17: return typeof(int);
                case 18: return typeof(string);
                case 19: return typeof(string);
                case 20: return typeof(int);

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
