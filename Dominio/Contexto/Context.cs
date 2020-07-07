using Dominio.Entidades.PerfilUsuario;
using Dominio.Entidades.Usuario;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Dominio.Contexto
{
    public class Context : IdentityDbContext<Usuario, Perfil, int, UsuarioLogin, PerfilUsuario, Afirmacoes>
    {
        public Context()
            : base("DefaultConnection")
        {
        }
    
    }
}
