using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders.v5 
{
   public class VisitOccurrenceDataReader52 : IDataReader
   {
      private readonly IEnumerator<VisitOccurrence> visitEnumerator;
      private readonly KeyMasterOffset offset;
      // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
      public VisitOccurrenceDataReader52(List<VisitOccurrence> batch, KeyMasterOffset offset)
      {
         visitEnumerator = batch.GetEnumerator();
         this.offset = offset;
      }

      public bool Read()
      {
         return visitEnumerator.MoveNext();
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
               return visitEnumerator.Current.Id + offset.VisitOccurrenceOffset;
            case 1:
               return visitEnumerator.Current.PersonId;
            case 2:
               return visitEnumerator.Current.ConceptId;
            case 3:
               return visitEnumerator.Current.StartDate;
            case 4:
               return visitEnumerator.Current.StartTime;
            case 5:
               return visitEnumerator.Current.EndDate;
            case 6:
               return visitEnumerator.Current.EndTime;
            case 7:
               return visitEnumerator.Current.TypeConceptId;
            case 8:
               return visitEnumerator.Current.ProviderId == 0 ? null : visitEnumerator.Current.ProviderId;
            case 9:
               return visitEnumerator.Current.CareSiteId == 0 ? null : visitEnumerator.Current.CareSiteId;
            case 10:
               return visitEnumerator.Current.SourceValue;
            case 11:
               return visitEnumerator.Current.SourceConceptId;
            case 12:
               return visitEnumerator.Current.AdmittingSourceConceptId;
            case 13:
               return visitEnumerator.Current.AdmittingSourceValue;
            case 14:
               return visitEnumerator.Current.DischargeToConceptId;
            case 15:
               return visitEnumerator.Current.DischargeToSourceValue;
            case 16:
               return visitEnumerator.Current.PrecedingVisitOccurrenceId;
            
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
               return "StartTime";
            case 5:
               return "EndDate";
            case 6:
               return "EndTime";
            case 7:
               return "TypeConceptId";
            case 8:
               return "ProviderId";
            case 9:
               return "CareSiteId";
            case 10:
               return "SourceValue";
            case 11:
               return "SourceConceptId";
            case 12:
               return "AdmittingSourceConceptId";
            case 13:
               return "AdmittingSourceValue";
            case 14:
               return "DischargeToConceptId";
            case 15:
               return "DischargeToSourceValue";
            case 16:
               return "PrecedingVisitOccurrenceId";
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
               return typeof(string);
            case 5:
               return typeof(DateTime);
            case 6:
               return typeof(string);
            case 7:
               return typeof(int?);
            case 8:
               return typeof(long?);
            case 9:
               return typeof(int?);
            case 10:
               return typeof(string);
            case 11:
               return typeof(long?);
            case 12:
               return typeof(int?);
            case 13:
               return typeof(string);
            case 14:
               return typeof(int?);
            case 15:
               return typeof(string);
            case 16:
               return typeof(int?);

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
