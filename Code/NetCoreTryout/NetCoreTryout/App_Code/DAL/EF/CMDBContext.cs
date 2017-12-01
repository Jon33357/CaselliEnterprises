using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace NetCoreTryout.App_Code.DAL.EF
{
    public partial class CMDBContext : DbContext
    {
        public virtual DbSet<Config> Config { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserConfig> UserConfig { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            #warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
            optionsBuilder.UseSqlServer(@"Data Source=.;Initial Catalog=CMDB;Integrated Security=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Config>(entity =>
            {
                entity.HasKey(e => e.Name)
                    .HasName("PK_Config");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Value)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Name)
                    .HasName("PK_User");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Key).HasMaxLength(50);
            });

            modelBuilder.Entity<UserConfig>(entity =>
            {
                entity.HasKey(e => new { e.UserName, e.ConfigName })
                    .HasName("PK_UserConfig");

                entity.Property(e => e.UserName).HasMaxLength(50);

                entity.Property(e => e.ConfigName).HasMaxLength(50);

                entity.HasOne(d => d.ConfigNameNavigation)
                    .WithMany(p => p.UserConfig)
                    .HasForeignKey(d => d.ConfigName)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_UserConfig_Config");

                entity.HasOne(d => d.UserNameNavigation)
                    .WithMany(p => p.UserConfig)
                    .HasForeignKey(d => d.UserName)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_UserConfig_User");
            });
        }
    }
}