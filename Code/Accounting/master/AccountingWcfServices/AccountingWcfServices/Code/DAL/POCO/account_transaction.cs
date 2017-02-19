namespace AccountingWcfServices.Code.DAL.POCO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class account_transaction
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string entity_code { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string document_id { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string id { get; set; }

        [StringLength(50)]
        public string transaction_description { get; set; }

        [Column(TypeName = "smallmoney")]
        public decimal? transaction_amount { get; set; }

        [Column(TypeName = "date")]
        public DateTime? transaction_date { get; set; }

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

        public virtual account_document account_document { get; set; }
    }
}
