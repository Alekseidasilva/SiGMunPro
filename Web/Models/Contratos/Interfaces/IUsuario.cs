using System;
using System.Collections.Generic;
using System.Data;
using Web.Models.Entidades.Usuario;

namespace Web.Models.Contratos.Interfaces
{
    interface IUsuario:IBase<User>
    {
        DataTable BuscarPorEmail(string email);
        User BuscarEntidadePeloId(int id);
        bool VerificarUsuario(string userName);
        bool VerificarSenha(string userName, string senha);
        int BuscarTentativas(string userName);
        Boolean BuscarEstado(string userName);
        string BuscarNomeDoCadastrador(int userid);
        List<User> BuscarListaPeloId(int id);
        void Tentativas(string userName, int tentativas);
        int TotalUsuariosCadastrados();
        Boolean AlterarSenha(int id, string senhaAntiga, string senhanova);
        List<User> SelecionarTodosComPerfilId();

        void SessaoUsuario(string UserName, string senha);
    }
}
