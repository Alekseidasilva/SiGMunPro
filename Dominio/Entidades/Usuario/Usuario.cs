using Dominio.Entidades.PerfilUsuario;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Dominio.Entidades.Usuario
{
    public class Usuario:IdentityUser<int,UsuarioLogin,PerfilUsuario.PerfilUsuario,Afirmacoes>
    {
    }
}
   