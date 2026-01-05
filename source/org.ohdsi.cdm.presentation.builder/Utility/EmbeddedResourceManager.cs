using Spectre.Console;

namespace org.ohdsi.cdm.presentation.builder.Utility
{
    public static class EmbeddedResourceManager
    {
        /// <summary>
        /// Returns the contents of all embedded resources matching the given filters. If a resource is present in multiple assemblies, only 1 of them will be returned
        /// </summary>
        /// <param name="resourceNameFilter">Substring filter for resource name. Null for all.</param>
        /// <param name="assemblyNameFilter">Substring filter for assembly name. Null for all.</param>
        /// <param name="stringComparison">String comparison type.</param>
        /// <returns></returns>
        public static Dictionary<string, string> ReadEmbeddedResources(
            string? assemblyNameFilter = null,
            string? resourceNameFilter = null,
            StringComparison stringComparison = StringComparison.Ordinal)
        {
            var result = new Dictionary<string, string>();

            var assemblies = AppDomain.CurrentDomain.GetAssemblies();
            var assembliesRelated = assemblies
                .Where(s => s.GetName().Name != null)
                .Where(s => string.IsNullOrEmpty(assemblyNameFilter)
                         || s.GetName().Name!.Contains(assemblyNameFilter, stringComparison))
                .ToList();

            foreach (var assembly in assembliesRelated)
            {
                var resourceNames = assembly.GetManifestResourceNames();
                var resourceNamesRelated = resourceNames
                    .Where(s => string.IsNullOrEmpty(resourceNameFilter)
                             || s.Contains(resourceNameFilter, stringComparison))
                    .ToList();

                foreach (var resourceName in resourceNamesRelated)
                {
                    try
                    {
                        using Stream? stream = assembly.GetManifestResourceStream(resourceName);
                        if (stream == null)
                            continue;
                        using var reader = new StreamReader(stream);
                        result[resourceName] = reader.ReadToEnd();
                    }
                    catch (Exception e)
                    {
                        AnsiConsole.WriteLine($"Error reading embedded resource: {assembly.FullName ?? ""} {resourceName ?? ""}");
                        AnsiConsole.WriteLine(e.Message);
                    }
                }
            }

            return result;
        }
    }
}
