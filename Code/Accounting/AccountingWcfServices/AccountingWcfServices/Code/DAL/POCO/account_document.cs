namespace AccountingWcfService.Code.DAL.POCO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class account_document
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public account_document()
        {
            account_transaction = new HashSet<account_transaction>();
        }

        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string entity_code { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string document_id { get; set; }

        [StringLength(255)]
        public string doc_location { get; set; }

        [StringLength(50)]
        public string state_code { get; set; }

        public DateTime? state_date { get; set; }

        public DateTime last_modified_date { get; set; }

        [Required]
        [StringLength(50)]
        public string last_modified_by { get; set; }

        public DateTime created_date { get; set; }

        [Required]
        [StringLength(50)]
        public string created_by { get; set; }

        public long occ_version { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<account_transaction> account_transaction { get; set; }
    }
}
