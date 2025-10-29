using Spectre.Console;
using Spectre.Console.Rendering;
using System.Diagnostics;

namespace org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;
public class MemoryColumn : ProgressColumn
{
    public static double MaxMbMemoryProcess { get; protected set; } = 0;
    public static double MaxMbMemoryGC { get; protected set; } = 0;
    public static double CurrentMbMemoryProcess { get; protected set; } = 0;
    public static double CurrentMbMemoryGC { get; protected set; } = 0;

    private readonly Process _process = Process.GetCurrentProcess();

    public override IRenderable Render(RenderOptions options, ProgressTask task, TimeSpan deltaTime)
    {
        _process.Refresh();

        double mbMemoryProcess = _process.WorkingSet64 / 1024.0 / 1024.0;
        double mbMemoryGC = GC.GetTotalMemory(false) / 1024.0 / 1024.0;

        if (mbMemoryProcess > MaxMbMemoryProcess)
            MaxMbMemoryProcess = mbMemoryProcess;
        if(mbMemoryGC > MaxMbMemoryGC)
            MaxMbMemoryGC = mbMemoryGC;

        CurrentMbMemoryGC = mbMemoryGC;
        CurrentMbMemoryProcess = mbMemoryProcess;

        if (new[] { "Processing", "chunks"}.All(s => task.Description.Contains(s)))
        {
            string text = $" Memory: Process /  GC" +
                $"\r\nCurrent[yellow]:{mbMemoryProcess,5:F0} MB[/] / {mbMemoryGC,5:F0} MB. " +
                $"\r\n   Peak[red]:{MaxMbMemoryProcess,5:F0} MB[/] / {MaxMbMemoryGC,5:F0} MB";

            return new Markup(text);
        }
        else
            return new Markup("");
    }
}
