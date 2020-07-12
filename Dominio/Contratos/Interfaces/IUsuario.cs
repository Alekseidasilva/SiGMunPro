using Dominio.Entidades.Usuario;

namespace Dominio.Contratos.Interfaces
{
    public interface IUsuario:IBase<User>
   {
       User BuscarPorEmail(string email);
       User BuscarPorNome(string nome);
       User Login(string email, string senha);
       void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha);

   }
}
