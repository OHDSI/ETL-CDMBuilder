using org.ohdsi.cdm.framework.desktop;
using System.Data;

namespace org.ohdsi.cdm.presentation.builder.CdmFrameworkImport
{
    /// <summary>
    /// Snapshot of the class from Etl-LambdaBuilder as of commit 9f2756c6 (2025-08-22 14:16:57).
    /// </summary>
    /// <param name="batch"></param>
    /// <remarks>
    /// This version is preserved as all the methods depend on the old _chunks table version.
    /// </remarks>
    public class ChunkDataReader(List<ChunkRecord> batch) : IDataReader
    {
        private readonly IEnumerator<ChunkRecord> _enumerator = batch.GetEnumerator();

        public bool Read()
        {
            return _enumerator.MoveNext();
        }

        public int FieldCount
        {
            get { return 3; }
        }

        public object GetValue(int i)
        {
            return i switch
            {
                0 => _enumerator.Current.Id,
                1 => _enumerator.Current.PersonId,
                2 => _enumerator.Current.PersonSource,
                _ => throw new NotImplementedException(),
            };
        }

        #region implementationn not required for SqlBulkCopy
        public bool NextResult()
        {
            throw new NotImplementedException();
        }

        public void Close()
        {
            throw new NotImplementedException();
        }

        public bool IsClosed
        {
            get { throw new NotImplementedException(); }
        }

        public int Depth
        {
            get { throw new NotImplementedException(); }
        }

        public DataTable GetSchemaTable()
        {
            throw new NotImplementedException();
        }

        public int RecordsAffected
        {
            get { throw new NotImplementedException(); }
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public bool GetBoolean(int i)
        {
            throw new NotImplementedException();
        }

        public byte GetByte(int i)
        {
            throw new NotImplementedException();
        }

        public long GetBytes(int i, long fieldOffset, byte[] buffer, int bufferoffset, int length)
        {
            throw new NotImplementedException();
        }

        public char GetChar(int i)
        {
            throw new NotImplementedException();
        }

        public long GetChars(int i, long fieldoffset, char[] buffer, int bufferoffset, int length)
        {
            throw new NotImplementedException();
        }

        public IDataReader GetData(int i)
        {
            throw new NotImplementedException();
        }

        public string GetName(int i)
        {
            return i switch
            {
                0 => "chunkid",
                1 => "person_id",
                2 => "person_source_value",
                _ => throw new NotImplementedException(),
            };
        }

        public string GetDataTypeName(int i)
        {
            throw new NotImplementedException();
        }

        public DateTime GetDateTime(int i)
        {
            throw new NotImplementedException();
        }

        public decimal GetDecimal(int i)
        {
            throw new NotImplementedException();
        }

        public double GetDouble(int i)
        {
            throw new NotImplementedException();
        }

        public Type GetFieldType(int i)
        {
            return i switch
            {
                0 => typeof(int),
                1 => typeof(long),
                2 => typeof(string),
                _ => throw new NotImplementedException(),
            };
        }

        public float GetFloat(int i)
        {
            throw new NotImplementedException();
        }

        public Guid GetGuid(int i)
        {
            throw new NotImplementedException();
        }

        public short GetInt16(int i)
        {
            throw new NotImplementedException();
        }

        public int GetInt32(int i)
        {
            throw new NotImplementedException();
        }

        public long GetInt64(int i)
        {
            throw new NotImplementedException();
        }

        public int GetOrdinal(string name)
        {
            throw new NotImplementedException();
        }

        public string GetString(int i)
        {
            throw new NotImplementedException();
        }

        public int GetValues(object[] values)
        {
            var cnt = 0;
            for (var i = 0; i < FieldCount; i++)
            {
                values[i] = GetValue(i);
                cnt++;
            }

            return cnt;
        }

        public bool IsDBNull(int i)
        {
            throw new NotImplementedException();
        }

        public object this[string name]
        {
            get { throw new NotImplementedException(); }
        }

        public object this[int i]
        {
            get { throw new NotImplementedException(); }
        }
        #endregion
    }
}
