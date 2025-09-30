using org.ohdsi.cdm.framework.common.Enums;
using org.ohdsi.cdm.framework.common.Extensions;
using org.ohdsi.cdm.framework.desktop.Databases;
using org.ohdsi.cdm.framework.desktop.Enums;
using org.ohdsi.cdm.presentation.builder.Utility.GetSqlHelperTranslators;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace org.ohdsi.cdm.presentation.builder.Utility
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
    }
}
