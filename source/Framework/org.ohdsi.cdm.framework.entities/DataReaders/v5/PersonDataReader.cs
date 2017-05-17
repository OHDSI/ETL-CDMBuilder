using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders.v5 
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
         get { return 18; }
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
               return personEnumerator.Current.TimeOfBirth;
            case 6:
               return personEnumerator.Current.RaceConceptId;
            case 7:
               return personEnumerator.Current.EthnicityConceptId;
            case 8:
               return personEnumerator.Current.LocationId;
            case 9:
               return personEnumerator.Current.ProviderId == 0 ? null : personEnumerator.Current.ProviderId;
            case 10:
               return personEnumerator.Current.CareSiteId == 0 ? null : personEnumerator.Current.CareSiteId;
            case 11:
               return personEnumerator.Current.PersonSourceValue;
            case 12:
               return personEnumerator.Current.GenderSourceValue;
            case 13:
               return personEnumerator.Current.GenderSourceConceptId;
            case 14:
               return personEnumerator.Current.RaceSourceValue;
            case 15:
               return personEnumerator.Current.RaceSourceConceptId;
            case 16:
               return personEnumerator.Current.EthnicitySourceValue;
            case 17:
               return personEnumerator.Current.EthnicitySourceConceptId;

            default:
               throw new NotImplementedException();
         }
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
               return "TimeOfBirth";
            case 6:
               return "RaceConceptId";
            case 7:
               return "EthnicityConceptId";
            case 8:
               return "LocationId";
            case 9:
               return "ProviderId";
            case 10:
               return "CareSiteId";
            case 11:
               return "PersonSourceValue";
            case 12:
               return "GenderSourceValue";
            case 13:
               return "GenderSourceConceptId";
            case 14:
               return "RaceSourceValue";
            case 15:
               return "RaceSourceConceptId";
            case 16:
               return "EthnicitySourceValue";
            case 17:
               return "EthnicitySourceConceptId";

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
               return typeof(int?);
            case 3:
               return typeof(int?);
            case 4:
               return typeof(int?);
            case 5:
               return typeof(string);
            case 6:
               return typeof(int?);
            case 7:
               return typeof(int?);
            case 8:
               return typeof(int?);
            case 9:
               return typeof(long?);
            case 10:
               return typeof(int?);
            case 11:
               return typeof(string);
            case 12:
               return typeof(string);
            case 13:
               return typeof(int?);
            case 14:
               return typeof(string);
            case 15:
               return typeof(int?);
            case 16:
               return typeof(string);
            case 17:
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
