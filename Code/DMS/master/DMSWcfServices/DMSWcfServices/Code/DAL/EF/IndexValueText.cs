//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DMSWcfServices.Code.DAL.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class IndexValueText
    {
        public long indexing_unit_id { get; set; }
        public string index_code { get; set; }
        public string value { get; set; }
    
        public virtual Index Index { get; set; }
    }
}
