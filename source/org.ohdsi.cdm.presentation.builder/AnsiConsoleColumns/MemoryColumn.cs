using Spectre.Console;
using Spectre.Console.Rendering;
using System;
using System.Diagnostics;

namespace org.ohdsi.cdm.presentation.Builder.AnsiConsoleHelpers;
public class MemoryColumn : ProgressColumn
{
    private readonly Process _process = Process.GetCurrentProcess();

    public override IRenderable Render(RenderOptions options, ProgressTask task, TimeSpan deltaTime)
    {
        _process.Refresh();

        double memoryMb = _process.WorkingSet64 / 1024.0 / 1024.0;
        double momoryGC = GC.GetTotalMemory(false) / 1024.0 / 1024.0;

        string text = $"[yellow]{memoryMb,6:F0} MB[/] (GC {momoryGC,4:F0})";

        return new Markup(text);
    }
}
