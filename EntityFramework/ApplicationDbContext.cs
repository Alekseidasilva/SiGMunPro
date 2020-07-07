using Dominio.Entidades.Usuario;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio.Entidades.PerfilUsuario;

namespace EntityFramework
{
    public class ApplicationDbContext : IdentityDbContext<Usuario, Perfil, int, UsuarioLogin, PerfilUsuario, Afirmacoes>
    {
        public ApplicationDbContext()
            : base("DefaultConnection")
        {
        }

        //protected override void OnModelCreating(DbModelBuilder modelBuilder)
        //{
        //    base.OnModelCreating(modelBuilder);
        //    modelBuilder.Entity<ApplicationUser>();
        //}
        //public static ApplicationDbContext Create()
        //{
        //    return new ApplicationDbContext();
        //}
        //}
    }
}
