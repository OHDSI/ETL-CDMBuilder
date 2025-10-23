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

            foreach (var assembly in assemblies)
            {
                if (assemblyNameFilter != null &&
                    !assembly.GetName().Name?.Contains(assemblyNameFilter, stringComparison) == true)                
                    continue;

                var resourceNames = assembly.GetManifestResourceNames();

                foreach (var resourceName in resourceNames)
                {
                    if(resourceNameFilter != null &&
                        !resourceName.Contains(resourceNameFilter, stringComparison))
                        continue;

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
                        Console.WriteLine($"Error reading embedded resource: {assembly.FullName ?? ""} {resourceName ?? ""}");
                        Console.WriteLine(e.Message);
                    }
                }
            }

            return result;
        }
    }
}
