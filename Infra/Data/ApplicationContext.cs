using Dominio.Entidades.Perfil;
using Dominio.Entidades.Usuario;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;


namespace Infra.Data
{
    public class ApplicationContext
    :IdentityDbContext<User,Role,int,UserLogin,UserRole,UserClaim>
    {
        public ApplicationContext() 
            : base("ConnString")
        {

        }
        //public virtual DbSet<> TB_Perfils { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //Nomeação das Entidades
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<User>().ToTable("TBUsuarios");

           //modelBuilder.Entity("")









            modelBuilder.Entity<Role>().ToTable("TBPerfil");
            //modelBuilder.Entity<UserRole>().ToTable("TBPerfilUsuario");
            //modelBuilder.Entity<UserLogin>().ToTable("TBUsuarioLogin");
            //modelBuilder.Entity<UserClaim>().ToTable("TBUsuariosAfirmacoes");








        }

    }
}
