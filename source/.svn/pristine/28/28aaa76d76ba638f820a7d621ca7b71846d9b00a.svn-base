using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace org.ohdsi.cdm.framework.shared.Helpers
{
   public class SerializationHelper
   {
      public static object ByteArrayToObject(byte[] byteArray)
      {
         var memoryStream = new MemoryStream(byteArray);
         var binaryFormatter = new BinaryFormatter();
         memoryStream.Position = 0;
         return binaryFormatter.Deserialize(memoryStream);
      }

      public static byte[] ObjectToByteArray(Object obj)
      {
         if (obj == null)
            return null;
         var bf = new BinaryFormatter();
         var ms = new MemoryStream();
         bf.Serialize(ms, obj);
         return ms.ToArray();
      }
   }
}
