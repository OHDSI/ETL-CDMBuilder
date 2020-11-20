using System;

namespace org.ohdsi.cdm.framework.common.Extensions
{
    public static class TimeSpanExtensions
    {
        public static string ToReadableString(this TimeSpan span)
        {
            var formatted = string.Format("{0}{1}{2}{3}",
                span.Duration().Days > 0 ? $"{span.Days:0} d, " : string.Empty,
                span.Duration().Hours > 0 ? $"{span.Hours:0} h, " : string.Empty,
                span.Duration().Minutes > 0 ? $"{span.Minutes:0} m, " : string.Empty,
                span.Duration().Seconds > 0 ? $"{span.Seconds:0} s" : string.Empty);

            if (formatted.EndsWith(", ")) formatted = formatted.Substring(0, formatted.Length - 2);

            if (string.IsNullOrEmpty(formatted)) formatted = "0 s";

            return formatted;
        }
    }
}
