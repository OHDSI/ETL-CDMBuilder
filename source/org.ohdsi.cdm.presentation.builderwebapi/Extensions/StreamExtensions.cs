using System.IO;

namespace org.ohdsi.cdm.presentation.builderwebapi.Extensions
{
    public static class StreamExtensions
    {
        public static byte[] GetByteArray(this Stream input)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                input.CopyTo(ms);
                return ms.ToArray();
            }
        }
    }
}