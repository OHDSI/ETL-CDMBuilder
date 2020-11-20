using org.ohdsi.cdm.framework.common.Builder;
using org.ohdsi.cdm.framework.common.Omop;
using System;
using System.Collections.Generic;
using System.Data;

namespace org.ohdsi.cdm.framework.common.DataReaders.v5
{
    public class MeasurementDataReader : IDataReader
    {
        private readonly IEnumerator<Measurement> _enumerator;
        private readonly KeyMasterOffsetManager _offset;

        // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
        public MeasurementDataReader(List<Measurement> batch, KeyMasterOffsetManager o)
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

        // is this called only because the datatype specific methods are not implemented?  
        // probably performance to be gained by not passing object back?
        public object GetValue(int i)
        {

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
                    return _enumerator.Current.Time;
                case 5:
                    return _enumerator.Current.TypeConceptId;
                case 6:
                    return _enumerator.Current.OperatorConceptId;
                case 7:
                    return _enumerator.Current.ValueAsNumber;
                case 8:
                    return _enumerator.Current.ValueAsConceptId;
                case 9:
                    return _enumerator.Current.UnitConceptId;
                case 10:
                    return _enumerator.Current.RangeLow;
                case 11:
                    return _enumerator.Current.RangeHigh;
                case 12:
                    return _enumerator.Current.ProviderId == 0 ? null : _enumerator.Current.ProviderId;
                case 13:
                    if (_enumerator.Current.VisitOccurrenceId.HasValue)
                    {
                        if (_offset.GetKeyOffset(_enumerator.Current.PersonId).VisitOccurrenceIdChanged)
                            return _offset.GetId(_enumerator.Current.PersonId,
                                _enumerator.Current.VisitOccurrenceId.Value);

                        return _enumerator.Current.VisitOccurrenceId.Value;
                    }

                    return null;
                case 14:
                    return _enumerator.Current.SourceValue;
                case 15:
                    return _enumerator.Current.SourceConceptId;
                case 16:
                    return _enumerator.Current.UnitSourceValue;
                case 17:
                    return _enumerator.Current.ValueSourceValue;

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
                    return "Time";
                case 5:
                    return "TypeConceptId";
                case 6:
                    return "OperatorConceptId";
                case 7:
                    return "ValueAsNumber";
                case 8:
                    return "ValueAsConceptId";
                case 9:
                    return "UnitConceptId";
                case 10:
                    return "RangeLow";
                case 11:
                    return "RangeHigh";
                case 12:
                    return "ProviderId";
                case 13:
                    return "VisitOccurrenceId";
                case 14:
                    return "SourceValue";
                case 15:
                    return "SourceConceptId";
                case 16:
                    return "UnitSourceValue";
                case 17:
                    return "ValueSourceValue";

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
                case 3:
                    return typeof(DateTime);
                case 4:
                    return typeof(TimeSpan);
                case 5:
                    return typeof(long);
                case 6:
                    return typeof(long?);
                case 7:
                    return typeof(decimal?);
                case 8:
                    return typeof(long?);
                case 9:
                    return typeof(long?);
                case 10:
                    return typeof(decimal?);
                case 11:
                    return typeof(decimal?);
                case 12:
                    return typeof(long?);
                case 13:
                    return typeof(long?);
                case 14:
                    return typeof(string);
                case 15:
                    return typeof(long?);
                case 16:
                    return typeof(string);
                case 17:
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
