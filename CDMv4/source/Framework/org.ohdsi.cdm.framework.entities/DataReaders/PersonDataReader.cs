using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders 
{
   public class PersonDataReader : IDataReader
   {
      private readonly IEnumerator<Person> personEnumerator;

      // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
      public PersonDataReader(List<Person> batch)
      {
         personEnumerator = batch.GetEnumerator();
      }

      public bool Read()
      {
         return personEnumerator.MoveNext();
      }
      
      public int FieldCount
      {
         get { return 14; }
      }

      public object GetValue(int i)
      {
         switch (i)
         {
            case 0:
               return personEnumerator.Current.PersonId;
            case 1:
               return personEnumerator.Current.GenderConceptId;
            case 2:
               return personEnumerator.Current.YearOfBirth;
            case 3:
               return personEnumerator.Current.MonthOfBirth;
            case 4:
               return personEnumerator.Current.DayOfBirth;
            case 5:
               return personEnumerator.Current.RaceConceptId;
            case 6:
               return personEnumerator.Current.EthnicityConceptId;
            case 7:
               return personEnumerator.Current.LocationId;
            case 8:
               return personEnumerator.Current.ProviderId;
            case 9:
               return personEnumerator.Current.CareSiteId;
            case 10:
               return personEnumerator.Current.PersonSourceValue;
            case 11:
               return personEnumerator.Current.GenderSourceValue;
            case 12:
               return personEnumerator.Current.RaceSourceValue;
            case 13:
               return personEnumerator.Current.EthnicitySourceValue;

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
               return "PersonId";
            case 1:
               return "GenderConceptId";
            case 2:
               return "YearOfBirth";
            case 3:
               return "MonthOfBirth";
            case 4:
               return "DayOfBirth";
            case 5:
               return "RaceConceptId";
            case 6:
               return "EthnicityConceptId";
            case 7:
               return "LocationId";
            case 8:
               return "ProviderId";
            case 9:
               return "CareSiteId";
            case 10:
               return "PersonSourceValue";
            case 11:
               return "GenderSourceValue";
            case 12:
               return "RaceSourceValue";
            case 13:
               return "EthnicitySourceValue";

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
