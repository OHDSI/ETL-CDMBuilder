using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders.v5 
{
   public class MeasurementDataReader : IDataReader
   {
      private readonly IEnumerator<Measurement> enumerator;
      private readonly KeyMasterOffset offset;
      
      // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
      public MeasurementDataReader(List<Measurement> batch, KeyMasterOffset offset)
      {
         enumerator = batch.GetEnumerator();
         this.offset = offset;
      }

      public bool Read()
      {
         return enumerator.MoveNext();
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
               return enumerator.Current.Id + offset.MeasurementOffset;
            case 1:
               return enumerator.Current.PersonId;
            case 2:
               return enumerator.Current.ConceptId;
            case 3:
               return enumerator.Current.StartDate;
            case 4:
               return enumerator.Current.Time;
            case 5:
               return enumerator.Current.TypeConceptId;
            case 6:
               return enumerator.Current.OperatorConceptId ?? 0;
            case 7:
               return enumerator.Current.ValueAsNumber;
            case 8:
               return enumerator.Current.ValueAsConceptId ?? 0;
            case 9:
               return enumerator.Current.UnitConceptId ?? 0;
            case 10:
               return enumerator.Current.RangeLow;
            case 11:
               return enumerator.Current.RangeHigh;
            case 12:
               return enumerator.Current.ProviderId == 0 ? null : enumerator.Current.ProviderId;
            case 13:
               return enumerator.Current.VisitOccurrenceId + offset.VisitOccurrenceOffset;
            case 14:
               return enumerator.Current.SourceValue;
            case 15:
               return enumerator.Current.SourceConceptId;
            case 16:
               return enumerator.Current.UnitSourceValue;
            case 17:
               return enumerator.Current.ValueSourceValue;
            
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
         throw new NotImplementedException();
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
