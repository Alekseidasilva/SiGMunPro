using System;
using System.Collections.Generic;
using MVC.Models.Entidades.Usuario;
using System.Data;

namespace MVC.Models.Contratos.Interfaces
{
    public interface IUsuario : IBase<User>
    {
        DataTable BuscarPorEmail(string email);
        bool VerificarUsuario(string userName);
        bool VerificarSenha(string userName, string senha);
        int BuscarTentativas(string userName);
        void Tentativas(string userName, int tentativas);
        
        Boolean AlterarSenha(int id,string senhaAntiga, string senhanova );
        List<User> SelecionarTodosComPerfilId();

    }
}
