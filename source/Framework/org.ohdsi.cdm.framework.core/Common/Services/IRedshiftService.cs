using System.ServiceModel;

namespace org.ohdsi.cdm.framework.core.Common.Services
{
    [ServiceContract]
    public interface IRedshiftService
    {
        [OperationContract]
        void Start();

        [OperationContract]
        void Stop();

        [OperationContract]
        void AddToSaveQueue(int chunkId);

        [OperationContract]
        int GetIndexOfSet(int chunkId);
    }
}
