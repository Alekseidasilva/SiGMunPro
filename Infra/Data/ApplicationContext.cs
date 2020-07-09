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
            base.OnModelCreating(modelBuilder);
            //modelBuilder.Entity<applica>()
        }

    }
}
