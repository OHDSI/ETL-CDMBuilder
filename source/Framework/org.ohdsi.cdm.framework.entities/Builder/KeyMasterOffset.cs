using System.Threading;

namespace org.ohdsi.cdm.framework.entities.Builder
{
   public class KeyMasterOffset
   {
      #region Variables
      private int coId;
      private int mId;
      private int oId;
      private int opId;
      private int vcId;
      private int pcId;
      private int dcId;
      private int deraId;
      private int ceraId;


      private int deId;
      private int poId;
      private int voId;
      private int ppId;
      private int devId;
      #endregion

      #region Properties
      public int ConditionOccurrenceId
      {
         get { return Interlocked.Increment(ref coId); }
      }

      public int MeasurementId
      {
         get { return Interlocked.Increment(ref mId); }
      }

      public int ObservationId
      {
         get { return Interlocked.Increment(ref oId); }
      }

      public int ObservationPeriodId
      {
         get { return Interlocked.Increment(ref opId); }
      }

      public int VisitCostId
      {
         get { return Interlocked.Increment(ref vcId); }
      }

      public int ProcedureCostId
      {
         get { return Interlocked.Increment(ref pcId); }
      }

      public int DeviceCostId
      {
         get { return Interlocked.Increment(ref dcId); }
      }

      public int DrugEraId
      {
         get { return Interlocked.Increment(ref deraId); }
      }

      public int ConditionEraId
      {
         get { return Interlocked.Increment(ref ceraId); }
      }

      // -----

      public int DrugExposureId
      {
         get { return Interlocked.Increment(ref deId); }
      }

      public int ProcedureOccurrenceId
      {
         get { return Interlocked.Increment(ref poId); }
      }

      public int VisitOccurrenceId
      {
         get { return Interlocked.Increment(ref voId); }
      }

      public int PayerPlanPeriodId
      {
         get { return Interlocked.Increment(ref ppId); }
      }

      public int DeviceExposureId
      {
         get { return Interlocked.Increment(ref devId); }
      }

      public bool DrugExposureIdChanged
      {
         get { return deId > 0; }
      }
      
      public bool ProcedureOccurrenceIdChanged
      {
         get { return poId > 0; }
      }

      public bool VisitOccurrenceIdChanged
      {
         get { return voId > 0; }
      }

      public bool PayerPlanPeriodIdChanged
      {
         get { return ppId > 0; }
      }

      public bool DeviceExposureIdChanged
      {
         get { return devId > 0; }
      }



      public bool ConditionOccurrenceIdChanged
      {
         get { return coId > 0; }
      }

      public bool MeasurementIdChanged
      {
         get { return mId > 0; }
      }

      public bool ObservationIdChanged
      {
         get { return oId > 0; }
      }

      public bool ObservationPeriodIdChanged
      {
         get { return opId > 0; }
      }

      public bool VisitCostIdChanged
      {
         get { return vcId > 0; }
      }

      public bool ProcedureCostIdChanged
      {
         get { return pcId > 0; }
      }

      public bool DeviceCostIdChanged
      {
         get { return dcId > 0; }
      }

      public bool DrugEraIdChanged
      {
         get { return deraId > 0; }
      }

      public bool ConditionEraIdChanged
      {
         get { return ceraId > 0; }
      }

      public long VisitOccurrenceOffset { get; set; }
      public long PayerPlanPeriodOffset { get; set; }
      public long DrugExposureOffset { get; set; }
      public long ProcedureOccurrenceOffset { get; set; }
      public long DeviceExposureOffset { get; set; }

      public long ConditionOccurrenceOffset { get; set; }
      public long MeasurementOffset { get; set; }
      public long ObservationOffset { get; set; }
      public long ObservationPeriodOffset { get; set; }
      public long VisitCostOffset { get; set; }
      public long ProcedureCostOffset { get; set; }
      public long DeviceCostOffset { get; set; }
      public long DrugEraOffset { get; set; }
      public long ConditionEraOffset { get; set; }
      #endregion
   }
}


