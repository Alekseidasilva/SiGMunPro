using System;
using System.Collections.Generic;
using System.Data;
using Web.Helpers;
using Web.Models.Entidades.Usuario;

namespace Web.Models.Contratos.Repositorios
{
    public class RepUsuario:RepBase
    {
         public string Cadastrar(User entidade)
        {
            try
            {
                _conexao.LimparParametro();
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
                _conexao.AdicionarParametros("@IdCadastrador", entidade.IdCadastrador);
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
                _conexao.AdicionarParametros("@Id", entidade.Id);
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
                _conexao.AdicionarParametros("@Idcadastrador", entidade.IdCadastrador);
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
                _conexao.AdicionarParametros("@UsuId", id);
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
        public void Tentativas(string userName, int tentativas)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserName", userName);
                _conexao.AdicionarParametros("@Tentativas", tentativas);
                _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Usuario_Tentativas");
                
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

        }
        public int BuscarTentativas(string userName)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserName", userName);
                var users = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_BuscarTentativas");
                int id = 0;
                foreach (DataRow item in users.Rows)
                {
                    id = Convert.ToInt32(item["AccessFailedCount"]);
                   
                }
                return id;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

        }
        public bool VerificarUsuario(string userName)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserName", userName);
                var users = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_VerificarLogin");
                int id=0;
                foreach (DataRow item in users.Rows)
                {
                    id = Convert.ToInt32(item["Id"]);
                    if (id > 0)
                        return true;
                }
                return false;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

        }
        public bool VerificarSenha(string userName, string senha)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserName", userName);
                _conexao.AdicionarParametros("@Senha", senha);
                var users = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_VerificarSenha");
                int id = 0;
                foreach (DataRow item in users.Rows)
                {
                    id = Convert.ToInt32(item["Id"]);
                    if (id>0)
                    return true;
                }
                return false;

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
                _conexao.AdicionarParametros("@Id", id);
                _conexao.AdicionarParametros("@NovaSenha", senhanova);
                bool res = Boolean.Parse((_conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Usuario_AlterarSenha").ToString()));
                return res;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

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

        public void SessaoUsuario(string UserName, string senha)
        {           
           
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserName", UserName);
                _conexao.AdicionarParametros("@Senha", senha);
                var users = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_Sessao");
                foreach (DataRow item in users.Rows)
                {
                    GuardaSessao.Id= Convert.ToInt32(item["Id"]);
                    GuardaSessao.NomeCompleto = Convert.ToString(item["NomeCompleto"]);
                    GuardaSessao.Estado = Convert.ToBoolean(item["Estado"]);
                    GuardaSessao.DataCadastro = Convert.ToDateTime(item["DataCadastro"]);
                    GuardaSessao.Email = Convert.ToString(item["Email"]);
                    GuardaSessao.EmailConfirmed = Convert.ToBoolean(item["EmailConfirmed"]);
                    GuardaSessao.PhoneNumber = Convert.ToString(item["PhoneNumber"]);
                    GuardaSessao.PhoneNumberConfirmed = Convert.ToBoolean(item["PhoneNumberConfirmed"]);
                    GuardaSessao.TwoFactorEnabled = Convert.ToBoolean(item["TwoFactorEnabled"]);
                    GuardaSessao.LockoutEndDateUtc = Convert.ToDateTime(item["LockoutEndDateUtc"]);
                    GuardaSessao.LockoutEnabled = Convert.ToBoolean(item["LockoutEnabled"]);
                    GuardaSessao.AccessFailedCount = Convert.ToInt32(item["AccessFailedCount"]);
                    GuardaSessao.UserName = Convert.ToString(item["UserName"]);
                    GuardaSessao.PerfilId = Convert.ToInt32(item["PerfilId"]);
                    GuardaSessao.PerfilNome = Convert.ToString(item["PerfilNome"]);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public int TotalUsuariosCadastrados()
        {
            try
            {
                _conexao.LimparParametro();
                var Total = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_TotalCadastrado");
                int nTotal = 0;
                foreach (DataRow item in Total.Rows)
                {
                    nTotal = Convert.ToInt32(item["qtde"]);
                }

                return nTotal;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string BuscarNomeDoCadastrador(int userid)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserId", userid);
                var nome = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Usuario_BuscarNomeCadastrador");
                string userName = "";
                foreach (DataRow item in nome.Rows)
                {
                    userName = Convert.ToString(item["Username"]);
                }

                return userName;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    
    }
}