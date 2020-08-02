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
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@NomeCompleto",entidade.NomeCompleto);
                _conexao.AdicionarParametros("@UserName",entidade.UserName);
                _conexao.AdicionarParametros("@Email",entidade.Email);
                _conexao.AdicionarParametros("@EmailConfirmed",entidade.EmailConfirmed);
                _conexao.AdicionarParametros("@PasswordHash",entidade.PasswordHash);
                _conexao.AdicionarParametros("@SecurityStamp",entidade.SecurityStamp);
                _conexao.AdicionarParametros("@PhoneNumber",entidade.PhoneNumber);
                _conexao.AdicionarParametros("@PhoneNumberConfirmed",entidade.PhoneNumberConfirmed);
                _conexao.AdicionarParametros("@TwoFactorEnabled",entidade.TwoFactorEnabled);
                _conexao.AdicionarParametros("@LockoutEndDateUtc",entidade.LockoutEndDateUtc);
                _conexao.AdicionarParametros("@LockoutEnabled",entidade.LockoutEnabled);
                _conexao.AdicionarParametros("@AccessFailedCount",entidade.AccessFailedCount);
                _conexao.AdicionarParametros("@DataCadastro",entidade.DataCadastro);
                _conexao.AdicionarParametros("@Estado",entidade.Estado);
                _conexao.AdicionarParametros("@PerfilId",entidade.PerfilId);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Usuario_Inserir").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string Alterar(User entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id",entidade.Id);
                _conexao.AdicionarParametros("@NomeCompleto", entidade.NomeCompleto);
                _conexao.AdicionarParametros("@UserName", entidade.UserName);
                _conexao.AdicionarParametros("@Email", entidade.Email);
                _conexao.AdicionarParametros("@EmailConfirmed", entidade.EmailConfirmed);
                _conexao.AdicionarParametros("@PasswordHash", entidade.PasswordHash);
                _conexao.AdicionarParametros("@SecurityStamp", entidade.SecurityStamp);
                _conexao.AdicionarParametros("@PhoneNumber", entidade.PhoneNumber);
                _conexao.AdicionarParametros("@PhoneNumberConfirmed", entidade.PhoneNumberConfirmed);
                _conexao.AdicionarParametros("@TwoFactorEnabled", entidade.TwoFactorEnabled);
                _conexao.AdicionarParametros("@LockoutEndDateUtc", entidade.LockoutEndDateUtc);
                _conexao.AdicionarParametros("@LockoutEnabled", entidade.LockoutEnabled);
                _conexao.AdicionarParametros("@AccessFailedCount", entidade.AccessFailedCount);
                _conexao.AdicionarParametros("@DataCadastro", entidade.DataCadastro);
                _conexao.AdicionarParametros("@Estado", entidade.Estado);
                _conexao.AdicionarParametros("@PerfilId", entidade.PerfilId);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Usuario_Alterar").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

        }

        public string Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public User BuscarPorId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UsuId",id);
                DataTable usuarios = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_BuscarPorId");
                User user = new User();
                foreach (DataRow item in usuarios.Rows)
                {
                    user.Id = Convert.ToInt32(item["Id"]);
                    user.UserName = Convert.ToString(item["UserName"]);
                    user.NomeCompleto = Convert.ToString(item["NomeCompleto"]);
                    user.Email = Convert.ToString(item["Email"]);
                    user.PhoneNumber = Convert.ToString(item["PhoneNumber"]);
                    user.DataCadastro = Convert.ToDateTime(item["DataCadastro"]);
                    user.Estado = Convert.ToBoolean(item["Estado"]);
                    user.PerfilId = Convert.ToInt32(item["PerfilId"]);
                }

                return user;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<User> BuscarPorNome(string nome)
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

        public List<User> SelecionarTodosComPerfilId()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable usuarios = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_CarregarTodosComPerfilId");

                List<User> users = new List<User>();
                foreach (DataRow item in usuarios.Rows)
                {
                    User user = new User
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        UserName = Convert.ToString(item["UserName"]),
                        NomeCompleto = Convert.ToString(item["NomeCompleto"]),
                        Email = Convert.ToString(item["Email"]),
                        PhoneNumber = Convert.ToString(item["PhoneNumber"]),
                        DataCadastro = Convert.ToDateTime(item["DataCadastro"]),
                        Estado = Convert.ToBoolean(item["Estado"]),
                        PerfilId = Convert.ToInt32(item["PerfilId"])
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
                        PhoneNumber = Convert.ToString(item["PhoneNumber"]),
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