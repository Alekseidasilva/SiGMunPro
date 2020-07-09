using Microsoft.AspNet.Identity.EntityFramework;

namespace Dominio.Entidades.Usuario
{
    public class UserLogin:IdentityUserLogin<int>
    {
        public string Email { get; set; }
        public string Senha { get; set; }
    }
}
