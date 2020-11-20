using System.Globalization;
using System.IO;
using System.Text;

namespace org.ohdsi.cdm.framework.desktop.Savers
{
    public class FileSaver : Saver
    {
        private string _fileName;
        private string _cdmFolder;

        public FileSaver(string cdmFolder)
        {
            _cdmFolder = cdmFolder;
        }

        public override void Write(int? chunkId, int? subChunkId, System.Data.IDataReader reader, string tableName)
        {
            var folder = _cdmFolder;

            folder = Path.Combine(folder, tableName);
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            if (chunkId.HasValue)
                _fileName = Path.Combine(folder, chunkId.Value.ToString(CultureInfo.InvariantCulture));

            var isFirstRow = true;
            using (var writer = new StreamWriter(_fileName))
            {
                while (reader.Read())
                {
                    if (isFirstRow)
                    {
                        var header = new StringBuilder();
                        for (var i = 0; i < reader.FieldCount; i++)
                        {
                            header.Append(reader.GetName(i));
                            if (i != reader.FieldCount - 1) header.Append("\t");
                        }
                        writer.WriteLine(header);
                        isFirstRow = false;
                    }

                    var row = new StringBuilder();
                    for (var i = 0; i < reader.FieldCount; i++)
                    {
                        row.Append(reader.GetValue(i));
                        if (i != reader.FieldCount - 1) row.Append("\t");
                    }
                    writer.WriteLine(row);
                }
            }
        }

        public override void Rollback()
        {
            if (File.Exists(_fileName))
                File.Delete(_fileName);
        }
    }
}
