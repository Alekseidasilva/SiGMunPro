using MVC.Models.Entidades.Usuario;
using System.Data;

namespace MVC.Models.Contratos.Interfaces
{
    public interface IUsuario : IBase<User>
    {
           DataTable BuscarPorEmail(string email);
        User Login(string email, string senha);
        void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha);

    }
}
