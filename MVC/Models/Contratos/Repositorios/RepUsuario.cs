using Infra.Data;
using MVC.Models.Contratos.Interfaces;
using MVC.Models.Entidades.Usuario;
using System;
using System.Collections.Generic;
using System.Data;
using MVC.helpers;

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
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserId", id);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Usuario_Excluir").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
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
           
        }

        public Boolean AlterarSenha(int id, string senhaAntiga, string senhanova)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id",id);
                _conexao.AdicionarParametros("@NovaSenha",senhanova);
                bool res =Boolean.Parse((_conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Usuario_AlterarSenha").ToString()));
                return res;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            return true;
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

        public void SessaoUsuario(string email, string senha)
        {
            SessaoUsuario sessao = new helpers.SessaoUsuario();
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Email", email);
                _conexao.AdicionarParametros("@Senha", senha);
                var users = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_Sessao");
                foreach (DataRow item in users.Rows)
                {
                    helpers.SessaoUsuario.Id = Convert.ToInt32(item["Id"]);
                    helpers.SessaoUsuario.NomeCompleto = Convert.ToString(item["NomeCompleto"]);
                     helpers.SessaoUsuario.Estado = Convert.ToBoolean(item["Estado"]);
                     helpers.SessaoUsuario.DataCadastro = Convert.ToDateTime(item["DataCadastro"]);
                    helpers.SessaoUsuario.Email = Convert.ToString(item["Email"]);
                    helpers.SessaoUsuario.EmailConfirmed = Convert.ToBoolean(item["EmailConfirmed"]);
                    helpers.SessaoUsuario.PhoneNumber = Convert.ToString(item["PhoneNumber"]);
                    helpers.SessaoUsuario.PhoneNumberConfirmed = Convert.ToBoolean(item["PhoneNumberConfirmed"]);
                    helpers.SessaoUsuario.TwoFactorEnabled = Convert.ToBoolean(item["TwoFactorEnabled"]);
                    helpers.SessaoUsuario.LockoutEndDateUtc = Convert.ToDateTime(item["LockoutEndDateUtc"]);
                    helpers.SessaoUsuario.LockoutEnabled = Convert.ToBoolean(item["LockoutEnabled"]);
                    helpers.SessaoUsuario.AccessFailedCount = Convert.ToInt32(item["AccessFailedCount"]);
                    helpers.SessaoUsuario.UserName = Convert.ToString(item["UserName"]);
                    helpers.SessaoUsuario.PerfilId = Convert.ToInt32(item["PerfilId"]);
                    helpers.SessaoUsuario.PerfilNome = Convert.ToString(item["PerfilNome"]);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}