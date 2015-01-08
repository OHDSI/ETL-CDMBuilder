using System;
using System.Collections.Generic;
using System.IO;

namespace org.ohdsi.cdm.framework.core.Lookups
{
	class ReferenceFileLookup : ILookup
	{
		private Dictionary<string, long?> source_mappings;
		private string fileName;
		public ReferenceFileLookup(string aFile)
		{
			fileName = aFile;
		}

		public void Load()
		{
			source_mappings = new Dictionary<string, long?>();
			// load values from file into dictionary
			string contents = File.ReadAllText(fileName);
			string[] rows = contents.Split(new string[] { "\n", "\r\n" }, StringSplitOptions.RemoveEmptyEntries);
			foreach (string row in rows)
			{
				if (row.StartsWith("#"))
					continue; // skip # lines, they are used for comments

				string[] nvp = row.Split('\t');

				if (!source_mappings.ContainsKey(nvp[0]))
				{
					source_mappings.Add(nvp[0], Convert.ToInt64(nvp[1]));
				}
			}
		}

		public long? LookupValue(string sourceValue)
		{
		   if (source_mappings.ContainsKey(sourceValue))
			{
				return source_mappings[sourceValue];
			}
		   return null;
		}
	}
}
