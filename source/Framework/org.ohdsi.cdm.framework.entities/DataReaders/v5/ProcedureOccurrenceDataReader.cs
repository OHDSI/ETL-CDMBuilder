using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders.v5
{
   public class ProcedureOccurrenceDataReader : IDataReader
   {
      private readonly IEnumerator<ProcedureOccurrence> procedureEnumerator;
      private readonly KeyMasterOffset offset;
      // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
      public ProcedureOccurrenceDataReader(List<ProcedureOccurrence> batch, KeyMasterOffset offset)
      {
         procedureEnumerator = batch.GetEnumerator();
         this.offset = offset;
      }

      public bool Read()
      {
         return procedureEnumerator.MoveNext();
      }

      public int FieldCount
      {
         get { return 12; }
      }

      public object GetValue(int i)
      {
         if (procedureEnumerator.Current == null) return null;

         switch (i)
         {
            case 0:
               return procedureEnumerator.Current.Id + offset.ProcedureOccurrenceOffset;
            case 1:
               return procedureEnumerator.Current.PersonId;
            case 2:
               return procedureEnumerator.Current.ConceptId;
            case 3:
               return procedureEnumerator.Current.StartDate;
            case 4:
               return procedureEnumerator.Current.TypeConceptId;
            case 5:
               return procedureEnumerator.Current.ModifierConceptId ?? 0;
            case 6:
               return procedureEnumerator.Current.Quantity;
            case 7:
               return procedureEnumerator.Current.ProviderId == 0 ? null : procedureEnumerator.Current.ProviderId;
            case 8:
               return procedureEnumerator.Current.VisitOccurrenceId + offset.VisitOccurrenceOffset;
            case 9:
               return procedureEnumerator.Current.SourceValue;
            case 10:
               return procedureEnumerator.Current.SourceConceptId;
            case 11:
               return procedureEnumerator.Current.QualifierSourceValue;
            
            default:
               throw new NotImplementedException();
         }
      }

      public string GetName(int i)
      {
         if (procedureEnumerator.Current == null) return null;

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
               return "TypeConceptId";
            case 5:
               return "ModifierConceptId";
            case 6:
               return "Quantity";
            case 7:
               return "ProviderId";
            case 8:
               return "VisitOccurrenceId";
            case 9:
               return "SourceValue";
            case 10:
               return "SourceConceptId";
            case 11:
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
         if (procedureEnumerator.Current == null) return null;

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
               return typeof(int?);
            case 5:
               return typeof(long?);
            case 6:
               return typeof(int);
            case 7:
               return typeof(long?);
            case 8:
               return typeof(long?);
            case 9:
               return typeof(string);
            case 10:
               return typeof(long?);
            case 11:
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
