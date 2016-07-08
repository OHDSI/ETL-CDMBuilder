using System.Collections.Generic;
using System.ServiceModel;

namespace org.ohdsi.cdm.framework.core.CommonVocabulary
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
