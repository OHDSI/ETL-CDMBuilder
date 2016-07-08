using System.Threading;

namespace org.ohdsi.cdm.framework.entities.Builder
{
   public class KeyMasterOffset
   {
      #region Variables
      private static int deId;
      private static int poId;
      private static int voId;
      private static int ppId;
      #endregion

      #region Properties
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

      public long VisitOccurrenceOffset { get; set; }
      public long PayerPlanPeriodOffset { get; set; }
      public long DrugExposureOffset { get; set; }
      public long ProcedureOccurrenceOffset { get; set; }
      #endregion
   }
}


