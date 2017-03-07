//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DMSWcfService.App_Code.DAL.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Document
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Document()
        {
            this.Page = new HashSet<Page>();
            this.DocGroup = new HashSet<DocGroup>();
        }
    
        public System.Guid id { get; set; }
        public string type_code { get; set; }
        public short version { get; set; }
        public string doc_location { get; set; }
        public string state_code { get; set; }
        public Nullable<System.DateTime> state_date { get; set; }
        public System.DateTime last_modified_date { get; set; }
        public string last_modified_by { get; set; }
        public System.DateTime created_date { get; set; }
        public string created_by { get; set; }
        public long occ_version { get; set; }
    
        public virtual DocType DocType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Page> Page { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DocGroup> DocGroup { get; set; }
    }
}