using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Description;

namespace org.ohdsi.cdm.framework.core.Common.Services
{
    public class ServicesManager
    {
        public static ServiceHost CreateServiceHost<T>(Type contract, string address)
        {
            var host = new ServiceHost(typeof(T), new[] { new Uri("net.pipe://localhost") });
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
                ReceiveTimeout = TimeSpan.MaxValue,
                ReaderQuotas =
                {
                    MaxStringContentLength = 2147483647,
                    MaxArrayLength = 2147483647,
                    MaxDepth = 2147483647,
                    MaxBytesPerRead = 2147483647
                }
            };

            host.AddServiceEndpoint(contract, binding, address);
            host.Open();

            return host;
        }

        public static void AddToSaveQueue(int chunkId)
        {
            var channelFactory = GetChannelFactory<IRedshiftService>("net.pipe://localhost/RedshiftServiceEndpoint");
            var svc = channelFactory.CreateChannel();
            svc.AddToSaveQueue(chunkId);
            channelFactory.Close();
        }

        public static int GetIndexOfSet(int chunkId)
        {
            var channelFactory = GetChannelFactory<IRedshiftService>("net.pipe://localhost/RedshiftServiceEndpoint");
            var svc = channelFactory.CreateChannel();
            var index = svc.GetIndexOfSet(chunkId);
            channelFactory.Close();

            return index;
        }

        public static void StartSaver()
        {
            var channelFactory = GetChannelFactory<IRedshiftService>("net.pipe://localhost/RedshiftServiceEndpoint");
            var svc = channelFactory.CreateChannel();
            svc.Start();
            channelFactory.Close();
        }

        public static void StopSaver()
        {
            var channelFactory = GetChannelFactory<IRedshiftService>("net.pipe://localhost/RedshiftServiceEndpoint");
            var svc = channelFactory.CreateChannel();
            svc.Stop();
            channelFactory.Close();
        }

        public static void AddProviders(KeyValuePair<string, long>[] values)
        {
            var channelFactory = GetChannelFactory<IVocabularyService>("net.pipe://localhost/VocabularyServiceEndpoint");
            var svc = channelFactory.CreateChannel();
            svc.AddProviders(values);
            channelFactory.Close();
        }

        //public static KeyValuePair<string, long>[] GetProviderIds(string[] sources)
        //{
        //   var channelFactory = GetChannelFactory<IVocabularyService>("net.pipe://localhost/VocabularyServiceEndpoint");
        //   var svc = channelFactory.CreateChannel();
        //   var result = svc.GetProviderIds(sources);
        //   channelFactory.Close();

        //   return result;
        //}

        public static ChannelFactory<T> GetChannelFactory<T>(string uri)
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

            var pipeFactory = new ChannelFactory<T>(binding, new EndpointAddress(uri));

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
