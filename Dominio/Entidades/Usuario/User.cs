using System.Collections;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Dominio.Entidades.Usuario
{
    public class User
        :IdentityUser<int,UserLogin,UserRole,UserClaim>
    {
        public bool Estado { get; set; }
    }
}
