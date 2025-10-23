using Spectre.Console;
using Spectre.Console.Rendering;
using System.Diagnostics;

namespace org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;
public class MemoryColumn : ProgressColumn
{
    public static double MaxMemoryMb { get; protected set; } = 0;
    public static double MaxMemoryGC { get; protected set; } = 0;

    private readonly Process _process = Process.GetCurrentProcess();

    public override IRenderable Render(RenderOptions options, ProgressTask task, TimeSpan deltaTime)
    {
        _process.Refresh();

        double memoryMb = _process.WorkingSet64 / 1024.0 / 1024.0;
        double memoryGC = GC.GetTotalMemory(false) / 1024.0 / 1024.0;

        if (memoryMb > MaxMemoryMb)
            MaxMemoryMb = memoryMb;
        if(memoryGC > MaxMemoryGC)
            MaxMemoryGC = memoryGC;

        if (task.Description == "Processing chunks...")
        {
            string text = $"Memory. [yellow]Current total:{memoryMb,6:F0} MB[/] / GC {memoryGC,4:F0} MB. [red]Peak total:{MaxMemoryMb,6:F0} MB[/] / GC {MaxMemoryGC,4:F0} MB";

            return new Markup(text);
        }
        else
            return new Markup("");
    }
}
