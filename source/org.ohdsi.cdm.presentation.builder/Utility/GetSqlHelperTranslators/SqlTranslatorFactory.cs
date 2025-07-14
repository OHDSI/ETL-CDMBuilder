using org.ohdsi.cdm.framework.desktop.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.Utility.GetSqlHelperTranslators
{
    static class TranslatorFactory
    {
        public static ISqlTranslator GetTranslator(Database db, string schemaName, string? tableName) 
            => db switch
            {
                Database.Postgre => new SqlTranslatorPostgres(schemaName, tableName),
                Database.MsSql => new SqlTranslatorMsSql(schemaName, tableName),
                Database.MySql => new SqlTranslatorMySql(schemaName, tableName),
                _ => throw new NotImplementedException(
                    $"Database {db.ToString()} is not supported for translation from Redshift")
            };
    }
}
