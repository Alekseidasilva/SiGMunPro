using Microsoft.AspNet.Identity.EntityFramework;
using MVC.Models.Entidades.Perfils;
using MVC.Models.Entidades.Usuario;
using System.Data.Entity;

namespace MVC.Contexto
{
    public class ApplicationDbContext : IdentityDbContext<User, Role, int, UserLogin, UserRole, UserClaim>
    {
        public ApplicationDbContext()
            : base("server=SOFTDEV;User Id=sa; Password=049222Xp12; database=SiGMunDB;")
        {

        }
        //public DbSet<User> TB_Usuarios { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //Nomeação das Entidades
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<User>().ToTable("TB_Usuarios");
            //modelBuilder.Entity<User>().ToTable("TB_Usuarios").Property(p=>p.Id).HasColumnName("UsuId");
            modelBuilder.Entity<Role>().ToTable("TB_Perfil");
            modelBuilder.Entity<UserRole>().ToTable("TB_Permissoes");
            modelBuilder.Entity<UserLogin>().ToTable("TB_UsuarioLogin");
            modelBuilder.Entity<UserClaim>().ToTable("TB_UsuariosAfirmacoes");

        }

    }
}
