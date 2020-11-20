using org.ohdsi.cdm.framework.common.Extensions;
using System;
using System.Data;

namespace org.ohdsi.cdm.framework.common.Definitions
{
    public class Condition1
    {
        private readonly string _variableName;
        private readonly int _value;
        private readonly string _comparison;

        public Condition1(string expression)
        {
            var res = expression.Split(new[] { '=' }, StringSplitOptions.RemoveEmptyEntries);
            if (res.Length == 2)
            {
                _comparison = "=";
            }
            else
            {
                res = expression.Split(new[] { '>' }, StringSplitOptions.RemoveEmptyEntries);
                if (res.Length == 2)
                {
                    _comparison = ">";
                }
                else
                {
                    res = expression.Split(new[] { '<' }, StringSplitOptions.RemoveEmptyEntries);
                    if (res.Length == 2)
                    {
                        _comparison = "<";
                    }
                }
            }

            if (res.Length != 2 || string.IsNullOrEmpty(res[0]) || string.IsNullOrEmpty(res[1]))
                throw new Exception("Condition: Wrong parameters count");

            _variableName = res[0].Replace("{", "").Replace("}", "").Trim();
            _value = int.Parse(res[1]);
        }

        public bool Match(IDataRecord reader)
        {
            var soureValue = reader.GetInt(_variableName);

            switch (_comparison)
            {
                case "=":
                    return soureValue == _value;

                case ">":
                    return soureValue > _value;

                case "<":
                    return soureValue < _value;

                default:
                    throw new Exception("Condition: incorrect match");
            }
        }
    }
}
