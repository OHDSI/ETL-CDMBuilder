using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v5
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
                    return _enumerator.Current.ConceptId;
                case 3:
                    return _enumerator.Current.StartDate;
                case 4:
                    return _enumerator.Current.EndDate;
                case 5:
                    return _enumerator.Current.TypeConceptId;
                case 6:
                    return _enumerator.Current.StopReason;
                case 7:
                    return _enumerator.Current.Refills;
                case 8:
                    return _enumerator.Current.Quantity;
                case 9:
                    return _enumerator.Current.DaysSupply;
                case 10:
                    return _enumerator.Current.Sig;
                case 11:
                    return _enumerator.Current.RouteConceptId;
                case 12:
                    return _enumerator.Current.EffectiveDrugDose;
                case 13:
                    return _enumerator.Current.DoseUnitConceptId;
                case 14:
                    return _enumerator.Current.LotNumber;
                case 15:
                    return _enumerator.Current.ProviderId == 0 ? null : _enumerator.Current.ProviderId;
                case 16:
                    if (_enumerator.Current.VisitOccurrenceId.HasValue)
                    {
                        if (_offset.GetKeyOffset(_enumerator.Current.PersonId).VisitOccurrenceIdChanged)
                            return _offset.GetId(_enumerator.Current.PersonId,
                                _enumerator.Current.VisitOccurrenceId.Value);

                        return _enumerator.Current.VisitOccurrenceId.Value;
                    }

                    return null;
                case 17:
                    return _enumerator.Current.SourceValue;
                case 18:
                    return _enumerator.Current.SourceConceptId;
                case 19:
                    return _enumerator.Current.RouteSourceValue;
                case 20:
                    return _enumerator.Current.DoseUnitSourceValue;
                default:
                    throw new NotImplementedException();
            }
        }

        public string GetName(int i)
        {
            switch (i)
            {
                case 0:
                    return "Id";
                case 1:
                    return "PersonId";
                case 2:
                    return "ConceptId";
                case 3:
                    return "StartDate";
                case 4:
                    return "EndDate";
                case 5:
                    return "TypeConceptId";
                case 6:
                    return "StopReason";
                case 7:
                    return "Refills";
                case 8:
                    return "Quantity";
                case 9:
                    return "DaysSupply";
                case 10:
                    return "Sig";
                case 11:
                    return "RouteConceptId";
                case 12:
                    return "EffectiveDrugDose";
                case 13:
                    return "DoseUnitConceptId";
                case 14:
                    return "LotNumber";
                case 15:
                    return "ProviderId";
                case 16:
                    return "VisitOccurrenceId";
                case 17:
                    return "SourceValue";
                case 18:
                    return "SourceConceptId";
                case 19:
                    return "RouteSourceValue";
                case 20:
                    return "DoseUnitSourceValue";
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
                    return typeof(long);
                case 2:
                    return typeof(long);
                    ;
                case 3:
                    return typeof(DateTime);
                case 4:
                    return typeof(DateTime);
                case 5:
                    return typeof(int?);
                case 6:
                    return typeof(string);
                case 7:
                    return typeof(int?);
                case 8:
                    return typeof(int?);
                case 9:
                    return typeof(int?);
                case 10:
                    return typeof(string);
                case 11:
                    return typeof(int?);
                case 12:
                    return typeof(decimal?);
                case 13:
                    return typeof(int?);
                case 14:
                    return typeof(string);
                case 15:
                    return typeof(int?);
                case 16:
                    return typeof(int?);
                case 17:
                    return typeof(string);
                case 18:
                    return typeof(int?);
                case 19:
                    return typeof(string);
                case 20:
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
