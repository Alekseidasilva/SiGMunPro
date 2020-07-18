using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MVC.Models.Entidades.Usuario;

namespace MVC.Models.Contratos.Interfaces
{
    public interface IUsuario : IBase<User>
    {
        User Login(string email, string senha);
        void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha);

    }
}
