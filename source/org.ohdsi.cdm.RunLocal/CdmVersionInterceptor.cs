using Castle.DynamicProxy;

namespace org.ohdsi.cdm.RunLocal
{
    /// <summary>
    /// This is a temporary solution due to how enums are processed during build, import etc. 
    /// This class will become obsolete if all enums from the Etl-LambadBuilder get manually enumerated, like v54=54, v6=6, etc. 
    /// </summary>
    public sealed class CdmVersionInterceptor : IInterceptor
    {
        public void Intercept(IInvocation inv)
        {
            if (inv.Method.IsSpecialName && inv.Method.Name == "get_CdmVersion")
            {
                // run original target get
                inv.Proceed();

                //get enum type of get
                var enumType = inv.Method.ReturnType;

                // hardcode V54 name despite number value
                string desiredName = "V54";
                if (!Enum.IsDefined(enumType, desiredName))
                    throw new NotSupportedException($"Enum {enumType.FullName} does not have {desiredName}");

                inv.ReturnValue = Enum.Parse(enumType, desiredName, ignoreCase: false);
                return;
            }

            inv.Proceed();
        }
    }
}
