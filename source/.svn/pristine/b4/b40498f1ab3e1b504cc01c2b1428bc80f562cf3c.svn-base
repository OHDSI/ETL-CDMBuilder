using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;

namespace org.ohdsi.cdm.framework.entities.DataReaders
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
         get { return 9; }
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
               return procedureEnumerator.Current.TypeConceptId;
            case 3:
               return procedureEnumerator.Current.StartDate;
            case 4:
               return procedureEnumerator.Current.ConceptId;
            case 5:
               return procedureEnumerator.Current.ProviderId == 0 ? null : procedureEnumerator.Current.ProviderId;
            case 6:
               return procedureEnumerator.Current.SourceValue;
            case 7:
               return procedureEnumerator.Current.VisitOccurrenceId + offset.VisitOccurrenceOffset;
            case 8:
               return procedureEnumerator.Current.ReleventConditionConceptId;
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
         if (procedureEnumerator.Current == null) return null;

         switch (i)
         {
            case 0:
               return "Id";
            case 1:
               return "PersonId";
            case 2:
               return "TypeConceptId";
            case 3:
               return "StartDate";
            case 4:
               return "ConceptId";
            case 5:
               return "ProviderId";
            case 6:
               return "SourceValue";
            case 7:
               return "VisitOccurrenceId";
            case 8:
               return "ReleventConditionConceptId";
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
