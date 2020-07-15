using System.Collections.Generic;
using Dominio.Entidades.Usuario;

namespace Dominio.Contratos.Interfaces
{
    public interface IUsuario:IBase<User>
   {
       List<User> BuscarPorEmail(string email);
    
       User Login(string email, string senha);
       void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha);

   }
}
