using Dominio.Entidades.Usuario;
using Microsoft.AspNet.Identity.EntityFramework;


namespace Dominio.Entidades.Perfil
{
   public class Role
       :IdentityRole<int,UserRole>
    {
        //public int Id { get; set; }
        //public string Name { get; set; }
        public bool Estado { get; set; }
    }
}
