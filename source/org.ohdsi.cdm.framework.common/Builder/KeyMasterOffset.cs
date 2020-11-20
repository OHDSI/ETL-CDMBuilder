using System.Threading;

namespace org.ohdsi.cdm.framework.common.Builder
{
    public class KeyMasterOffset
    {
        #region Variables

        private int _coId;
        private int _mId;
        private int _oId;
        private int _opId;
        private int _vcId;
        private int _pcId;
        private int _dcId;
        private int _deraId;
        private int _ceraId;


        private int _deId;
        private int _poId;
        private int _voId;
        private int _vdId;
        private int _ppId;
        private int _devId;

        private int _costId;
        private int _noteId;

        #endregion

        #region Properties

        public int ConditionOccurrenceId => Interlocked.Increment(ref _coId);

        public int MeasurementId => Interlocked.Increment(ref _mId);

        public int ObservationId => Interlocked.Increment(ref _oId);

        public int ObservationPeriodId => Interlocked.Increment(ref _opId);

        public int VisitCostId => Interlocked.Increment(ref _vcId);

        public int ProcedureCostId => Interlocked.Increment(ref _pcId);

        public int DeviceCostId => Interlocked.Increment(ref _dcId);

        public int DrugEraId => Interlocked.Increment(ref _deraId);

        public int ConditionEraId => Interlocked.Increment(ref _ceraId);

        public int DrugExposureId => Interlocked.Increment(ref _deId);

        public int ProcedureOccurrenceId => Interlocked.Increment(ref _poId);

        public int VisitOccurrenceId => Interlocked.Increment(ref _voId);
        public int VisitDetailId => Interlocked.Increment(ref _vdId);

        public int PayerPlanPeriodId => Interlocked.Increment(ref _ppId);

        public int DeviceExposureId => Interlocked.Increment(ref _devId);

        public int CostId => Interlocked.Increment(ref _costId);

        public int NoteId => Interlocked.Increment(ref _noteId);

        public bool DrugExposureIdChanged
        {
            get { return _deId > 0; }
        }

        public bool ProcedureOccurrenceIdChanged
        {
            get { return _poId > 0; }
        }

        public bool VisitOccurrenceIdChanged
        {
            get { return _voId > 0; }
        }
        public bool VisitDetailIdChanged
        {
            get { return _vdId > 0; }
        }

        public bool PayerPlanPeriodIdChanged
        {
            get { return _ppId > 0; }
        }

        public bool DeviceExposureIdChanged
        {
            get { return _devId > 0; }
        }



        public bool ConditionOccurrenceIdChanged
        {
            get { return _coId > 0; }
        }

        public bool MeasurementIdChanged
        {
            get { return _mId > 0; }
        }

        public bool ObservationIdChanged
        {
            get { return _oId > 0; }
        }

        public bool ObservationPeriodIdChanged
        {
            get { return _opId > 0; }
        }

        public bool VisitCostIdChanged
        {
            get { return _vcId > 0; }
        }

        public bool ProcedureCostIdChanged
        {
            get { return _pcId > 0; }
        }

        public bool DeviceCostIdChanged
        {
            get { return _dcId > 0; }
        }

        public bool DrugEraIdChanged
        {
            get { return _deraId > 0; }
        }

        public bool ConditionEraIdChanged
        {
            get { return _ceraId > 0; }
        }

        public bool CostIdChanged
        {
            get { return _costId > 0; }
        }

        public bool NoteIdChanged
        {
            get { return _noteId > 0; }
        }

        #endregion
    }
}


