using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders
{
    public class CohortDataReader : IDataReader
    {
      private readonly IEnumerator<Cohort> cohortEnumerator;

      // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
      public CohortDataReader(List<Cohort> batch)
      {
         cohortEnumerator = batch.GetEnumerator();
      }

      public bool Read()
      {
         return cohortEnumerator.MoveNext();
      }

      public int FieldCount
      {
         get { return 6; }
      }

      // is this called only because the datatype specific methods are not implemented?  
      // probably performance to be gained by not passing object back?
      public object GetValue(int i)
      {
         switch (i)
         {
            case 0:
                 return cohortEnumerator.Current.Id;
            case 1:
               return cohortEnumerator.Current.ConceptId;
            case 2:
               return cohortEnumerator.Current.StartDate;
            case 3:
               return cohortEnumerator.Current.EndDate;
            case 4:
               return cohortEnumerator.Current.PersonId;
            case 5:
               return cohortEnumerator.Current.StopReason;
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
               return "ConceptId";
            case 2:
               return "StartDate";
            case 3:
               return "EndDate";
            case 4:
               return "PersonId";
            case 5:
               return "StopReason";
            
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
