using System;
using System.Collections.Generic;
using System.Data;
using org.ohdsi.cdm.framework.entities.Builder;
using org.ohdsi.cdm.framework.entities.Omop;
using org.ohdsi.cdm.framework.shared.Extensions;

namespace org.ohdsi.cdm.framework.entities.DataReaders.v5 
{
   public class CostDataReader52 : IDataReader
   {
      private readonly IEnumerator<Cost> enumerator;
      private readonly KeyMasterOffset offset;

      // A custom DataReader is implemented to prevent the need for the HashSet to be transformed to a DataTable for loading by SqlBulkCopy
      public CostDataReader52(List<Cost> batch, KeyMasterOffset offset)
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
         get { return 22; }
      }

      public object GetValue(int i)
      {
         if (enumerator.Current == null) return null;

         switch (i)
         {
            case 0:
               return enumerator.Current.CostId + offset.VisitCostOffset; //TODO VisitCostOffset -> CostOffset

            case 1:
            {
               switch (enumerator.Current.Domain)
               {
                  case "Measurement":
                  case "Meas Value":
                     return enumerator.Current.EventId + offset.MeasurementOffset;
                  case "Observation":
                     return enumerator.Current.EventId + offset.ObservationOffset;
                  case "Procedure":
                     return enumerator.Current.EventId + offset.ProcedureOccurrenceOffset;
                  case "Device":
                     return enumerator.Current.EventId + offset.DeviceExposureOffset;
                  case "Drug":
                     return enumerator.Current.EventId + offset.DrugExposureOffset;
                  case "Visit":
                     return enumerator.Current.EventId + offset.VisitOccurrenceOffset;
               }
               return 0;
            }

            case 2:
               return enumerator.Current.Domain;

            case 3:
               return enumerator.Current.TypeId;

            case 4:
               return enumerator.Current.CurrencyConceptId;

            case 5:
               return enumerator.Current.TotalCharge.Round();

            case 6:
               return enumerator.Current.TotalCost.Round();

            case 7:
               return enumerator.Current.TotalPaid.Round();

            case 8:
               return enumerator.Current.PaidByPayer.Round();

            case 9:
               return enumerator.Current.PaidByPatient.Round();

            case 10:
               return enumerator.Current.PaidPatientCopay.Round();

            case 11:
               return enumerator.Current.PaidPatientCoinsurance.Round();

            case 12:
               return enumerator.Current.PaidPatientDeductible.Round();

            case 13:
               return enumerator.Current.PaidByPrimary.Round();

            case 14:
               return enumerator.Current.PaidIngredientCost.Round();

            case 15:
               return enumerator.Current.PaidDispensingFee.Round();
               
            case 16:
               return enumerator.Current.PayerPlanPeriodId.HasValue ? enumerator.Current.PayerPlanPeriodId + offset.PayerPlanPeriodOffset : null;

            case 17:
               return enumerator.Current.AmountAllowed.Round();

           case 18:
               return enumerator.Current.RevenueCodeConceptId;

           case 19:
               return enumerator.Current.RevenueCodeSourceValue;

           case 20:
               return enumerator.Current.DrgConceptId;

           case 21:
               return enumerator.Current.DrgSourceValue;
            

            default:
               throw new NotImplementedException();
         }
      }

      public string GetName(int i)
      {
         if (enumerator.Current == null) return null;

         switch (i)
         {

            case 0:
               return null;

            case 1:
               return "CostId";
            case 2:
               return "Domain";

            case 3:
               return "TypeId";

            case 4:
               return "CurrencyConceptId";

            case 5:
               return "TotalCharge";

            case 6:
               return "TotalCost";

            case 7:
               return "TotalPaid";

            case 8:
               return "PaidByPayer";

            case 9:
               return "PaidByPatient";

            case 10:
               return "PaidPatientCopay";

            case 11:
               return "PaidPatientCoinsurance";

            case 12:
               return "PaidPatientDeductible";

            case 13:
               return "PaidByPrimary";

            case 14:
               return "PaidIngredientCost";

            case 15:
               return "PaidDispensingFee";

            case 16:
               return "PayerPlanPeriodId";

            case 17:
               return "AmountAllowed";

            case 18:
               return "RevenueCodeConceptId";

            case 19:
               return "RevenueCodeSourceValue";

            case 20:
               return "DrgConceptId";
                      
            case 21:  
               return "DrgSourceValue";

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
         if (enumerator.Current == null) return null;

         switch (i)
         {
            case 0:
               return typeof (long);

            case 1:
               return typeof(long);

            case 2:
               return typeof(string);

            case 3:
               return typeof(long);

            case 4:
               return typeof(long);

            case 5:
               return typeof(decimal?);

            case 6:
               return typeof(decimal?);

            case 7:
               return typeof(decimal?);

            case 8:
               return typeof(decimal?);

            case 9:
               return typeof(decimal?);

            case 10:
               return typeof(decimal?);

            case 11:
               return typeof(decimal?);

            case 12:
               return typeof(decimal?);

            case 13:
               return typeof(decimal?);

            case 14:
               return typeof(decimal?);

            case 15:
               return typeof(decimal?);

            case 16:
               return typeof(long);

            case 17:
               return typeof(decimal?);

            case 18:
               return typeof(long);

            case 19:
               return typeof(string);

            case 20:
               return typeof(long);

            case 21:
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
