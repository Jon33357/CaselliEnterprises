namespace AccountingWcfService.Code.DAL.POCO
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class AccountingDB : DbContext
    {
        public AccountingDB()
            : base("name=AccountingDB1")
        {
        }

        public virtual DbSet<account_document> account_document { get; set; }
        public virtual DbSet<account_transaction> account_transaction { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<account_document>()
                .Property(e => e.entity_code)
                .IsUnicode(false);

            modelBuilder.Entity<account_document>()
                .Property(e => e.document_id)
                .IsUnicode(false);

            modelBuilder.Entity<account_document>()
                .Property(e => e.doc_location)
                .IsUnicode(false);

            modelBuilder.Entity<account_document>()
                .Property(e => e.state_code)
                .IsUnicode(false);

            modelBuilder.Entity<account_document>()
                .Property(e => e.last_modified_by)
                .IsUnicode(false);

            modelBuilder.Entity<account_document>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<account_document>()
                .HasMany(e => e.account_transaction)
                .WithRequired(e => e.account_document)
                .HasForeignKey(e => new { e.entity_code, e.document_id })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.entity_code)
                .IsUnicode(false);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.document_id)
                .IsUnicode(false);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.id)
                .IsUnicode(false);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.transaction_description)
                .IsUnicode(false);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.transaction_amount)
                .HasPrecision(10, 4);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.state_code)
                .IsUnicode(false);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.last_modified_by)
                .IsUnicode(false);

            modelBuilder.Entity<account_transaction>()
                .Property(e => e.created_by)
                .IsUnicode(false);
        }
    }
}
