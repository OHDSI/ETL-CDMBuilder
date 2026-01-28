using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.presentation.builder.Utility.NativeTranslators.GetSqlHelperTranslators;

namespace org.ohdsi.cdm.presentation.builder.Utility.NativeTranslators
{
    public static class GetSqlHelper
    {
        /// <summary>
        /// Translate select from Redshift to other SQL dialects
        /// </summary>
        /// <param name="vendor"></param>
        /// <param name="sourceDatabase"></param>
        /// <param name="query"></param>
        /// <param name="schemaName"></param>
        /// <param name="chunkId">Should be left null or blank for batch sqcript</param>
        /// <returns></returns>
        public static string TranslateSqlFromRedshift(Vendor vendor, Database sourceDatabase, string query, string chunkSchemaName, string schemaName, string? tableName, string? chunkId = "")
        {
            try
            {
                var translator = TranslatorFactory.GetTranslator(sourceDatabase, schemaName, tableName);
                var translated = translator.Translate(query);
                var finalized = FinalizeXmlToDbQueryConversion(translated, chunkId, chunkSchemaName, schemaName);

                if(!int.TryParse(chunkId, out int chunkIdInt)
                    || chunkIdInt == 0)
                    SaveTranslation(vendor.Name, tableName ?? "unknown", finalized);

                return finalized;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        static string FinalizeXmlToDbQueryConversion(string source, string? chunkId, string chunkSchemaName, string schemaName)
        {
            var result = source
                    .Replace("{0}", chunkId ?? "0")
                    .Replace("{sc}", schemaName)
                    .Replace("{sc_ch}", chunkSchemaName)
                    .Replace("&gt;", ">")
                    .Replace("&lt;", "<")
                    .Replace("&ge;", ">=")
                    .Replace("&le;", "<=")
                    .Trim()
                    ;
            return result;
        }

        static void SaveTranslation(string vendorName, string tableName, string sql)
        {
            var path = Path.Combine(Directory.GetCurrentDirectory(), "Cache", "Translations", vendorName, Settings.Current.Building.CdmEngine.Database.ToString());
            Directory.CreateDirectory(path);

            var fileName = $"{tableName}_{sql.GetHashCode()}.sql";
            File.WriteAllText(Path.Combine(path, fileName), sql);
        }
    }
}
