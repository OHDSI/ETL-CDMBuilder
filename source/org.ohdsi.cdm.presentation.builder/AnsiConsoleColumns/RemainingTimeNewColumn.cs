using org.ohdsi.cdm.presentation.builder;
using Spectre.Console;
using Spectre.Console.Rendering;

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

    public static int AverageSpeedPersonsPerMinute { get; protected set; }

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

            var timeToCheckAgainst = _personsProcessedPrevious == processed //no person has been processed since the previous time
                ? LastChangeTime //use the previous time to get the same string
                : now; //else get actual speed and renew the string

            var timeSpentTotal = timeToCheckAgainst - CreationTime;
            AverageSpeedPersonsPerMinute = timeSpentTotal.TotalMinutes < 1 ? 0 : Convert.ToInt32(processed / timeSpentTotal.TotalMinutes);
            res = GetMarkup(processed, Settings.Current.Building.PersonsCount);
            
            LastChangeTime = now;
            _personsProcessedPrevious = processed;
        }
        else
        {
            //always get actual estimation by AverageSpeedPersonsPerMinute
            var timeSpent = task.ElapsedTime.HasValue ? task.ElapsedTime.Value : new TimeSpan();
            res = GetMarkup(Convert.ToInt32(task.Value), Convert.ToInt32(task.MaxValue));
        }
        return new Markup(res);
    }

    string GetMarkup(int personsProcessed, int personsTotalCount)
    {
        var persons2Process = personsTotalCount - personsProcessed;
        var minutesLeftForProcessing = AverageSpeedPersonsPerMinute == 0 ? 0 : persons2Process / AverageSpeedPersonsPerMinute;
        TimeToFinishEstimated = new TimeSpan(0, minutesLeftForProcessing, 0);

        //can't use TotalHours in format masks
        var formated = $"{Convert.ToInt32(TimeToFinishEstimated.TotalHours).ToString().PadLeft(3, '0')}"
            + $":{TimeToFinishEstimated.Minutes.ToString().PadLeft(2, '0')}"
            + $":{TimeToFinishEstimated.Seconds.ToString().PadLeft(2, '0')}";

        var res = TimeToFinishEstimated.TotalMinutes < 1
            ? "[blue]__:__:__[/]"
            : $"[blue]{formated}[/]";
        return res;
    }

}
