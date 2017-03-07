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
    
    public partial class Page
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Page()
        {
            this.Batch_Page = new HashSet<Batch_Page>();
            this.Document = new HashSet<Document>();
        }
    
        public System.Guid production_id { get; set; }
        public int page_number { get; set; }
        public Nullable<long> indexing_unit_id { get; set; }
        public Nullable<System.DateTime> capture_date { get; set; }
        public string capture_orientation_type_code { get; set; }
        public string capture_size_type_code { get; set; }
        public string capture_resolution_type_code { get; set; }
        public string capture_color_type_code { get; set; }
        public string repository_code { get; set; }
        public string file_type_code { get; set; }
        public string file_name { get; set; }
        public string state_code { get; set; }
        public Nullable<System.DateTime> state_date { get; set; }
        public System.DateTime last_modified_date { get; set; }
        public string last_modified_by { get; set; }
        public System.DateTime created_date { get; set; }
        public string created_by { get; set; }
        public long occ_version { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Batch_Page> Batch_Page { get; set; }
        public virtual IndexingUnit IndexingUnit { get; set; }
        public virtual Production Production { get; set; }
        public virtual Repository Repository { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Document> Document { get; set; }
    }
}