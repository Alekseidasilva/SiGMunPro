using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using MVC.Models.Contratos.Interfaces;
using MVC.Models.Entidades.Perfils;

namespace MVC.Models.Contratos.Repositorios
{
    public class RepPerfil:IPerfil
    {
        Conexao _conexao=new Conexao();
        public string Cadastrar(Role entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Alterar(Role entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new System.NotImplementedException();
        }

        public DataTable BuscarPorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public DataTable BuscarPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public List<Role> SelecionarTodos()
        {
            throw new System.NotImplementedException();
        }

        public string CarregarPorUsuario(int Userid)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserId",Userid);
                string res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_PerfilDoUsuario").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}