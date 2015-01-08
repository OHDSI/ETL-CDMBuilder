using System.Collections.Generic;
using System.Data;
using System.Text.RegularExpressions;
using Ciloci.Flee;

namespace org.ohdsi.cdm.framework.core.Definitions
{
   public class Condition
   {
      private readonly ExpressionContext context = new ExpressionContext();
      //public string Expression { get; set; }
      private readonly string expression;
      private readonly IGenericExpression<bool> genericExpression;

      public Condition(string expression)
      {
         const string variablesPattern = "{[^}]*}"; //{Field}
         const string inStatementPattern = @"(\w+)(\s+)(IN)(\s+)\([^\(\)]*\)"; //Field IN (value1, value2)

         expression = ParseVariables(expression, variablesPattern);
         expression = ParseINStatement(expression, inStatementPattern);
         // Replace "Field IN (value1, value2)" -> Field = value1 OR Field = value2
         this.expression = expression.Replace("!=", "<>");

         genericExpression = context.CompileGeneric<bool>(this.expression);
      }

      public bool Match(IDataReader reader)
      {
         foreach (var v in context.Variables)
         {
            var source = reader[v.Key].ToString();

            if (v.Value is string)
            {
               context.Variables[v.Key] = source;
            }
            else
            {
               int value;
               int.TryParse(source, out value);
               context.Variables[v.Key] = value;
            }
         }
         
         return genericExpression.Evaluate();
      }

      private string ParseINStatement(string expression, string inStatementPattern)
      {
         foreach (var match in Regex.Matches(expression, inStatementPattern))
         {
            var inStatement = match.ToString().Replace("{", "").Replace("}", "");

            var inIndex = inStatement.IndexOf("IN");

            var variable = match.ToString().Substring(0, inIndex);

            var s = match.ToString().IndexOf('(') + 1;
            var e = match.ToString().IndexOf(')');
            var values = new List<string>();
            foreach (var value in match.ToString().Substring(s, e - s).Split(','))
            {
               values.Add(variable + "=" + value.Trim());
            }

            var res = string.Join(" OR ", values);
            expression = expression.Replace(match.ToString(), res);
         }

         return expression;
      }

      private string ParseVariables(string expression, string variablesPattern)
      {
         foreach (var match in Regex.Matches(expression, variablesPattern))
         {
            var variable = match.ToString().Replace("{", "").Replace("}", "");
            if (!context.Variables.ContainsKey(variable))
            {
               if (expression.Contains(@""""))
                  context.Variables.Add(variable, string.Empty);
               else
                  context.Variables.Add(variable, 0);
            }
         }

         expression = expression.Replace("{", "").Replace("}", "");
         return expression;
      }
   }
}
