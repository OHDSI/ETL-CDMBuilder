using System;
using org.ohdsi.cdm.framework.shared.Enums;

namespace org.ohdsi.cdm.framework.shared.Attributes
{
   public class CDMVersionAttribute : Attribute
   {
      private readonly CDMVersions value;

      public CDMVersionAttribute(CDMVersions value)
      {
         this.value = value;
      }

      public CDMVersions Value
      {
         get { return this.value; }
      }
   }
}
