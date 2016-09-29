using System.Collections.Generic;
using System.ServiceModel;

namespace org.ohdsi.cdm.framework.core.Common.Services
{
   [ServiceContract]
   public interface IVocabularyService
   {
      [OperationContract]
      KeyValuePair<string, long>[] GetProviderIds(string[] sources);

      [OperationContract]
      void AddProviders(KeyValuePair<string, long>[] values);
   }
}
