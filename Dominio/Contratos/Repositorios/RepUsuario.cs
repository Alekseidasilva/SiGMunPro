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
        private readonly AcessoDados _acessoDados=new AcessoDados();

        //public RepUsuario(AcessoDados acessoDados)
        //{
        //    _acessoDados = acessoDados;
        //}
        public string Alterar(User entidade)
        {
            throw new NotImplementedException();
        }

        public void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha)
        {
            throw new NotImplementedException();
        }

        public List<User> BuscarPorEmail(string email)
        {
            throw new NotImplementedException();
        }

        public User BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public List<User> BuscarPorNome(string nome)
        {
            try
            {
               _acessoDados.LimparParametro();
               _acessoDados.AdicionarParametros("@nome",nome);
               DataTable Users = _acessoDados.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_BuscarPorNome");
                IList<User> users = new List<User>();
                foreach (DataRow linha in Users.Rows)
                    {
                        User user = new User();
                        user.Id = Convert.ToInt32(linha["Id"]);
                        user.NomeCompleto = Convert.ToString(linha["NomeCompleto"]);
                        user.UserName = Convert.ToString(linha["UserName"]);
                        user.Email = Convert.ToString(linha["Email"]);
                        user.PhoneNumber = Convert.ToString(linha["PhoneNumber"]);
                        user.Estado = Convert.ToBoolean(linha["Estado"]);
                        users.Add(user);
                    }
                return (List<User>)users;
                }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string Cadastrar(User entidade)
        {
            throw new NotImplementedException();
        }

        public void Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public User Login(string email, string senha)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> SelecionarTodos()
        {
            try
            {
                _acessoDados.LimparParametro();
                DataTable usuarios = _acessoDados.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_CarregarTodos");
                IList<User> users = new List<User>();
                foreach (DataRow linha in usuarios.Rows)
                {
                    User user = new User();
                    user.Id = Convert.ToInt32(linha["Id"]);
                    user.NomeCompleto = Convert.ToString(linha["NomeCompleto"]);
                    user.UserName = Convert.ToString(linha["UserName"]);
                    user.Email = Convert.ToString(linha["Email"]);
                    user.PhoneNumber = Convert.ToString(linha["PhoneNumber"]);
                    user.Estado = Convert.ToBoolean(linha["Estado"]);
                    users.Add(user);
                }
                //using (var ctx = new ApplicationContext())
                //{
                //    users = ctx.Users.ToList();
                //}

                return users;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}
