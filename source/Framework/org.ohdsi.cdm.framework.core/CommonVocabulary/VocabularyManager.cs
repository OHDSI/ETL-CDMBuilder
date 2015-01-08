using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Description;

namespace org.ohdsi.cdm.framework.core.CommonVocabulary
{
   public class VocabularyManager
   {
      public static ServiceHost CreateServiceHost()
      {
         var host = new ServiceHost(typeof(VocabularyService), new[] { new Uri("net.pipe://localhost") });
         var debug = host.Description.Behaviors.Find<ServiceDebugBehavior>();
         if (debug == null)
         {
            host.Description.Behaviors.Add(
               new ServiceDebugBehavior { IncludeExceptionDetailInFaults = true });
         }
         else
         {
            if (!debug.IncludeExceptionDetailInFaults)
            {
               debug.IncludeExceptionDetailInFaults = true;
            }
         }

         var binding = new NetNamedPipeBinding
         {
            MaxBufferPoolSize = 2147483647,
            MaxBufferSize = 2147483647,
            MaxReceivedMessageSize = 2147483647,
            ReaderQuotas =
            {
               MaxStringContentLength = 2147483647,
               MaxArrayLength = 2147483647,
               MaxDepth = 2147483647,
               MaxBytesPerRead = 2147483647
            }
         };

         host.AddServiceEndpoint(typeof(IVocabularyService), binding, "VocabularyServiceEndpoint");
         host.Open();

         return host;
      }

      public static void AddProviders(KeyValuePair<string, long>[] values)
      {
         var channelFactory = GetChannelFactory();
         var svc = channelFactory.CreateChannel();
         svc.AddProviders(values);
         channelFactory.Close();
      }

      public static KeyValuePair<string, long>[] GetProviderIds(string[] sources)
      {
         var channelFactory = GetChannelFactory();
         var svc = channelFactory.CreateChannel();
         var result = svc.GetProviderIds(sources);
         channelFactory.Close();

         return result;
      }

      public static ChannelFactory<IVocabularyService> GetChannelFactory()
      {
         var binding = new NetNamedPipeBinding
         {
            MaxBufferPoolSize = 2147483647,
            MaxBufferSize = 2147483647,
            MaxReceivedMessageSize = 2147483647,
            SendTimeout = new TimeSpan(0, 5, 0),
            ReceiveTimeout = new TimeSpan(0, 5, 0),
            ReaderQuotas =
            {
               MaxStringContentLength = 2147483647,
               MaxArrayLength = 2147483647,
               MaxDepth = 2147483647,
               MaxBytesPerRead = 2147483647
            }
         };

         var pipeFactory = new ChannelFactory<IVocabularyService>(binding, new EndpointAddress("net.pipe://localhost/VocabularyServiceEndpoint"));

         foreach (OperationDescription op in pipeFactory.Endpoint.Contract.Operations)
         {
            var dataContractBehavior = op.Behaviors.Find<DataContractSerializerOperationBehavior>();
            if (dataContractBehavior != null)
            {
               dataContractBehavior.MaxItemsInObjectGraph = int.MaxValue;
            }
         }

         return pipeFactory;
      }
   }
}
