using Infra.Data;
using MVC.Models.Contratos.Interfaces;
using MVC.Models.Entidades.Usuario;
using System;
using System.Collections.Generic;
using System.Data;

namespace MVC.Models.Contratos.Repositorios
{
    public class RepUsuario:IUsuario
    {
        Conexao _conexao=new Conexao();
        public string Cadastrar(User entidade)
        {
            throw new NotImplementedException();
        }

        public string Alterar(User entidade)
        {
            throw new NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public DataTable BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public DataTable BuscarPorNome(string nome)
        {
            throw new NotImplementedException();
        }

        public DataTable BuscarPorEmail(string email)
        {
            throw new NotImplementedException();
        }

        public User Login(string email, string senha)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Email",email);
                _conexao.AdicionarParametros("@Senha",senha);
                var users = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_Login");
                User user=new User();
                foreach (DataRow item in users.Rows)
                {
                    user.Id = Convert.ToInt32(item["Id"]);
                    user.UserName = Convert.ToString(item["UserName"]);
                    user.NomeCompleto = Convert.ToString(item["NomeCompleto"]);
                    user.Email = Convert.ToString(item["Email"]);
                    user.PasswordHash = Convert.ToString(item["PasswordHash"]);
                    user.DataCadastro = Convert.ToDateTime(item["DataCadastro"]);
                    user.Estado = Convert.ToBoolean(item["Estado"]);
                }
                
                return user;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            throw new NotImplementedException();
        }

        public void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha)
        {
            throw new NotImplementedException();
        }

        public List<User> SelecionarTodos()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable usuarios = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_CarregarTodos");

                List<User> users = new List<User>();
                foreach (DataRow item in usuarios.Rows)
                {
                    User user = new User
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        UserName = Convert.ToString(item["UserName"]),
                        NomeCompleto = Convert.ToString(item["NomeCompleto"]),
                        Email = Convert.ToString(item["Email"]),
                        DataCadastro = Convert.ToDateTime(item["DataCadastro"]),
                        Estado = Convert.ToBoolean(item["Estado"]),
                    };
                    users.Add(user);
                }

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