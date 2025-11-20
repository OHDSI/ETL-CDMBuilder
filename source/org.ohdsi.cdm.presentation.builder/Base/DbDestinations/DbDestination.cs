using org.ohdsi.cdm.framework.desktop.Databases;
using System.Text.RegularExpressions;

namespace org.ohdsi.cdm.presentation.builder.Base.DbDestinations
{
    /// <summary>
    /// Created via DbDestinationFactory
    /// </summary>
    public abstract class DbDestination
    {
        public enum ActionStatus
        {
            Success,
            Failed,
            AlreadyExists
        }

        public string ConnectionString { get; }
        public IDatabaseEngine DbEngine { get; }
        public string SchemaName { get; }

        protected DbDestination(string connectionString, IDatabaseEngine dbEngine, string schemaName)
        {
            this.ConnectionString = connectionString;
            this.DbEngine = dbEngine;
            this.SchemaName = schemaName;
        }

        public abstract ActionStatus CreateDatabase(string query);

        public abstract ActionStatus CreateSchema();

        public abstract ActionStatus ExecuteQuery(string query);

        protected string CleanCommand(string command)
            => Regex.Replace(command, @"\s+", " ").Trim();
    }
}