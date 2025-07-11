using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.Utility.GetSqlHelperTranslators
{
    internal interface ISqlTranslator
    {
        string Translate(string query);
    }
}
