using Spectre.Console;
using Spectre.Console.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builder.AnsiConsoleColumns
{
    public sealed class FrozenElapsedTimeColumn : ProgressColumn
    {
        public override IRenderable Render(
            RenderOptions options,
            ProgressTask task,
            TimeSpan deltaTime)
        {            
            if (task.IsFinished)
            {
                var time = task.StopTime - task.StartTime;
                return new Markup($"[blue]{time:hh\\:mm\\:ss}[/]");
            }

            return new Markup($"[blue]{task.ElapsedTime:hh\\:mm\\:ss}[/]");
        }
    }

}
