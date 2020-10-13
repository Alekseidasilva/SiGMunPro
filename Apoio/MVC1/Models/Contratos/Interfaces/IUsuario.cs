using System;
using System.Collections.Generic;
using MVC.Models.Entidades.Usuario;
using System.Data;

namespace MVC.Models.Contratos.Interfaces
{
    public interface IUsuario : IBase<User>
    {
        DataTable BuscarPorEmail(string email);
        User Login(string userName, string senha);
        Boolean AlterarSenha(int id,string senhaAntiga, string senhanova );
        List<User> SelecionarTodosComPerfilId();

    }
}
