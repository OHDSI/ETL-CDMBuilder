using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders.v5 
{
   public class ObservationDataReader : IDataReader
   {
      private readonly IEnumerator<Observation> observationEnumerator;
      private readonly KeyMasterOffset offset;
      
      // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
      public ObservationDataReader(List<Observation> batch, KeyMasterOffset offset)
      {
         observationEnumerator = batch.GetEnumerator();
         this.offset = offset;
      }

      public bool Read()
      {
         return observationEnumerator.MoveNext();
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
               return observationEnumerator.Current.Id + offset.ObservationOffset;
            case 1:
               return observationEnumerator.Current.PersonId;
            case 2:
               return observationEnumerator.Current.ConceptId;
            case 3:
               return observationEnumerator.Current.StartDate;
            case 4:
               return observationEnumerator.Current.Time;
            case 5:
               return observationEnumerator.Current.TypeConceptId;
            case 6:
               return observationEnumerator.Current.ValueAsNumber;
            case 7:
               return observationEnumerator.Current.ValueAsString;
            case 8:
               return observationEnumerator.Current.ValueAsConceptId;
            case 9:
               return observationEnumerator.Current.QualifierConceptId;
            case 10:
               return observationEnumerator.Current.UnitsConceptId;
            case 11:
               return observationEnumerator.Current.ProviderId == 0 ? null : observationEnumerator.Current.ProviderId;
            case 12:
               return observationEnumerator.Current.VisitOccurrenceId + offset.VisitOccurrenceOffset;
            case 13:
               return observationEnumerator.Current.SourceValue;
            case 14:
               return observationEnumerator.Current.SourceConceptId;
            case 15:
               return observationEnumerator.Current.UnitsSourceValue;
            case 16:
               return observationEnumerator.Current.QualifierSourceValue;
            
            default:
               throw new NotImplementedException();
         }
      }

      public string GetName(int i)
      {
         switch (i)
         {
            case 0:
               return null;
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
               return "ValueAsNumber";
            case 7:
               return "ValueAsString";
            case 8:
               return "ValueAsConceptId";
            case 9:
               return "QualifierConceptId";
            case 10:
               return "UnitsConceptId";
            case 11:
               return "ProviderId";
            case 12:
               return "VisitOccurrenceId";
            case 13:
               return "SourceValue";
            case 14:
               return "SourceConceptId";
            case 15:
               return "UnitsSourceValue";
            case 16:
               return "QualifierSourceValue";

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
               return typeof(int?);
            case 6:
               return typeof(decimal?);
            case 7:
               return typeof(string);
            case 8:
               return typeof(long?);
            case 9:
               return typeof(long?);
            case 10:
               return typeof(long?);
            case 11:
               return typeof(long?);
            case 12:
               return typeof(long?);
            case 13:
               return typeof(string);
            case 14:
               return typeof(long?);
            case 15:
               return typeof(string);
            case 16:
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
