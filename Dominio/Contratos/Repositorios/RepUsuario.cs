 using Dominio.Contratos.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dominio.Contexto;
using Dominio.Entidades.Usuario;
using Infra.Data;

namespace Dominio.Contratos.Repositorios
{
    public class RepUsuario : IUsuario
    {
        private   AcessoDados _acessoDados;

       

        //public RepUsuario(AcessoDados acessoDados)
        //{
        //    _acessoDados = acessoDados;
        //}
        public string Alterar(User entidade)
        {
            
            try
            {
                _acessoDados.LimparParametro();
                _acessoDados.AdicionarParametros("",entidade.Id);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            string res="";
            return res;
        }

        public void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha)
        {
            throw new NotImplementedException();
        }

        public User BuscarPorEmail(string email)
        {
            throw new NotImplementedException();
        }

        public User BuscarPorNome(string nome)
        {
            throw new NotImplementedException();
        }

        public string Cadastrar(User entidade)
        {
            throw new NotImplementedException();
        }

        public void Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public void Excluir(User entidade)
        {
            throw new NotImplementedException();
        }

        public User Login(string email, string senha)
        {
            throw new NotImplementedException();
        }

        public User SelecionarPorId(int id)
        {
             throw new NotImplementedException();
        }

        public User SelecionarPorNome(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> SelecionarTodos()
        {
            _acessoDados.LimparParametro();
           DataTable usuarios= _acessoDados.ExecutarConsulta(CommandType.StoredProcedure, "");
           IList<User>users=new List<User>();
           foreach (DataRow linha in usuarios.Rows)
           {
               User user = new User();
               user.Id = Convert.ToInt32(linha["Id"]);
               user.NomeCompleto = Convert.ToString(linha["NomeCompleto"]);
               user.UserName = Convert.ToString(linha["UserName"]);
               user.Email = Convert.ToString(linha["Email"]);
               user.PhoneNumber = Convert.ToString(linha["PhoneNumber"]);
               user.Estado = Convert.ToBoolean(linha["Estado"]);
           }





            //var res=new List<User>();
            //using (var ctx=new ApplicationContext())
            //{
            //    res = ctx.Users.ToList();
            //}

            return users;
        }
    }
}
