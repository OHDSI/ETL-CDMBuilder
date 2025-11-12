using org.ohdsi.cdm.presentation.builder;
using Spectre.Console;
using Spectre.Console.Rendering;
using System.Diagnostics;

namespace org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;

public class RemainingTimeNewColumn : ProgressColumn
{
    #region PersonsProcessed
    public static int PersonsProcessed { get; protected set; }
    public static void IncrementPersonsProcessed(int byAmount) => PersonsProcessed += byAmount;
    public static void ResetPersonsProcessed() => PersonsProcessed = 0;

    private static int _personsProcessedPrevious = 0;
    #endregion

    public static DateTime CreationTime { get; protected set; }

    public static DateTime LastChangeTime { get; protected set; }

    public static double AverageSecondsPerPerson { get; protected set; }

    public static TimeSpan TimeToFinishEstimated { get; protected set; } = new TimeSpan();

    public RemainingTimeNewColumn()
    {
        CreationTime = DateTime.Now;
    }

    public override IRenderable Render(RenderOptions options, ProgressTask task, TimeSpan deltaTime)
    {
        var res = "";

        if (task.Description.Contains("Processing"))
        {
            var processed = PersonsProcessed;
            var now = DateTime.Now;

            #region get AverageSecondsPerPerson
            var timeToCheckAgainst = _personsProcessedPrevious == processed //no person has been processed since the previous time
                ? LastChangeTime //use the previous time to get the same string
                : now; //else get actual speed and renew the string

            var timeSpentTotal = timeToCheckAgainst - CreationTime;

            if (processed == 0 || timeSpentTotal.TotalSeconds < 1)
                AverageSecondsPerPerson = 0;
            else
                AverageSecondsPerPerson = timeSpentTotal.TotalSeconds / processed;
            #endregion

            res = GetMarkup(processed, Settings.Current.Building.PersonsCount);
            
            LastChangeTime = now;
            _personsProcessedPrevious = processed;
        }
        else
        {
            res = GetMarkup(Convert.ToInt32(task.Value), Convert.ToInt32(task.MaxValue));
        }
        return new Markup(res);
    }

    string GetMarkup(int personsProcessed, int personsTotalCount)
    {
        var persons2Process = personsTotalCount - personsProcessed;
        var secondsLeftForProcessing = Convert.ToInt32(persons2Process * AverageSecondsPerPerson);
        TimeToFinishEstimated = new TimeSpan(0, 0, secondsLeftForProcessing);

        //can't use TotalHours in format masks
        var formated = $"{Convert.ToInt32(TimeToFinishEstimated.TotalHours).ToString().PadLeft(3, '0')}"
            + $":{TimeToFinishEstimated.Minutes.ToString().PadLeft(2, '0')}"
            + $":{TimeToFinishEstimated.Seconds.ToString().PadLeft(2, '0')}";

        var res = TimeToFinishEstimated.TotalMinutes < 1
            ? "[blue]00:01:00[/]"
            : $"[blue]{formated}[/]";
        return res;
    }

}
