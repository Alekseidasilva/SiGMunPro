﻿using System;
using System.Collections.Generic;
using System.Data;
using Web.Models.Entidades.Usuario;

namespace Web.Models.Contratos.Interfaces
{
    interface IUsuario:IBase<User>
    {

        DataTable BuscarPorEmail(string email);
        bool VerificarUsuario(string userName);
        bool VerificarSenha(string userName, string senha);
        int BuscarTentativas(string userName);
        void Tentativas(string userName, int tentativas);

        Boolean AlterarSenha(int id, string senhaAntiga, string senhanova);
        List<User> SelecionarTodosComPerfilId();
    }
}