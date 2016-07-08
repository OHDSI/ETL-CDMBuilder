using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders 
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
               return null;
            case 1:
               return observationEnumerator.Current.PersonId;
            case 2:
               return observationEnumerator.Current.ConceptId;
            case 3:
               return observationEnumerator.Current.TypeConceptId;
            case 4:
               return observationEnumerator.Current.StartDate;
            case 5:
               return observationEnumerator.Current.Time;
            case 6:
               return observationEnumerator.Current.ValueAsNumber;
            case 7:
               return observationEnumerator.Current.ValueAsString;
            case 8:
               return observationEnumerator.Current.ValueAsConceptId;
            case 9:
               return observationEnumerator.Current.UnitsConceptId;
            case 10:
               return observationEnumerator.Current.RangeLow;
            case 11:
               return observationEnumerator.Current.RangeHigh;
            case 12:
               return observationEnumerator.Current.ProviderId == 0 ? null : observationEnumerator.Current.ProviderId;
            case 13:
               return observationEnumerator.Current.VisitOccurrenceId + offset.VisitOccurrenceOffset;
            case 14:
               return observationEnumerator.Current.SourceValue;
            case 15:
               return observationEnumerator.Current.UnitsSourceValue;
            case 16:
               return observationEnumerator.Current.RelevantConditionConceptId;
            
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
         throw new NotImplementedException();
      }

      public byte GetByte(int i)
      {
         throw new NotImplementedException();
      }

      public long GetBytes(int i, long fieldOffset, byte[] buffer, int bufferoffset, int length)
      {
         throw new NotImplementedException();
      }

      public char GetChar(int i)
      {
         throw new NotImplementedException();
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
         throw new NotImplementedException();
      }

      public decimal GetDecimal(int i)
      {
         throw new NotImplementedException();
      }

      public double GetDouble(int i)
      {
         throw new NotImplementedException();
      }

      public Type GetFieldType(int i)
      {
         throw new NotImplementedException();
      }

      public float GetFloat(int i)
      {
         throw new NotImplementedException();
      }

      public Guid GetGuid(int i)
      {
         throw new NotImplementedException();
      }

      public short GetInt16(int i)
      {
         throw new NotImplementedException();
      }

      public int GetInt32(int i)
      {
         throw new NotImplementedException();
      }

      public long GetInt64(int i)
      {
         throw new NotImplementedException();
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
               return "TypeConceptId";
            case 4:
               return "StartDate";
            case 5:
               return "Time";
            case 6:
               return "ValueAsNumber";
            case 7:
               return "ValueAsString";
            case 8:
               return "ValueAsConceptId";
            case 9:
               return "UnitsConceptId";
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
               return "UnitSourceValue";
            case 16:
               return "RelevantConditionConceptId";

            default:
               throw new NotImplementedException();
         }
      }

      public int GetOrdinal(string name)
      {
         throw new NotImplementedException();
      }

      public string GetString(int i)
      {
         throw new NotImplementedException();
      }

      public int GetValues(object[] values)
      {
         throw new NotImplementedException();
      }

      public bool IsDBNull(int i)
      {
         throw new NotImplementedException();
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
