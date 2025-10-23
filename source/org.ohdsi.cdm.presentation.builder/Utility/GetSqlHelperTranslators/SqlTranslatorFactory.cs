using org.ohdsi.cdm.framework.desktop.Enums;

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
