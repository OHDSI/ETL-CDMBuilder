using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;
using org.ohdsi.cdm.framework.core;
using org.ohdsi.cdm.framework.shared.Enums;
using org.ohdsi.cdm.presentation.postprocess.Postprocesses;

namespace org.ohdsi.cdm.presentation.postprocess.Processes.MotherChild
{
   internal class MotherChildProcess : RPostprocess
   {
      public MotherChildProcess(PostprocessSettings settings) : base(settings)
      {
      }
   }
}
