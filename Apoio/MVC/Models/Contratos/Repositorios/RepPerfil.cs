using Infra.Data;
using MVC.Models.Contratos.Interfaces;
using MVC.Models.Entidades.Perfils;
using System;
using System.Collections.Generic;
using System.Data;

namespace MVC.Models.Contratos.Repositorios
{
    public class RepPerfil : IPerfil
    {
        private readonly Conexao _conexao = new Conexao();
        public string Cadastrar(Role entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Name", entidade.Name);
                _conexao.AdicionarParametros("@Estado", entidade.Estado);
                _conexao.AdicionarParametros("@DataCadastro", entidade.DataCadastro);
                _conexao.AdicionarParametros("@Idcadastrador", entidade.IdCadastrador);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Perfil_Inserir").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public string Alterar(Role entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id", entidade.Id);
                _conexao.AdicionarParametros("@Name", entidade.Name);
                _conexao.AdicionarParametros("@Estado", entidade.Estado);

                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Perfil_Alterar").ToString();
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
                _conexao.AdicionarParametros("@Id", id);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Perfil_Excluir").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public Role BuscarPorId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id", id);
                DataTable res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Perfil_BuscarPorId");
                var perfils = new Role();
                foreach (DataRow item in res.Rows)
                {
                    Role role = new Role
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        Name = Convert.ToString(item["Name"]),
                        Estado = Convert.ToBoolean(item["Estado"]),
                        DataCadastro = Convert.ToDateTime(item["DataCadastro"])
                    };
                    perfils = role;
                }

                return perfils;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;

            }
        }
        public List<Role> BuscarPorNome(string nome)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Name", nome);
                DataTable res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Perfil_BuscarPorNome");
                List<Role> roles = new List<Role>();
                foreach (DataRow item in res.Rows)
                {
                    Role role = new Role
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        Name = Convert.ToString(item["Name"]),
                        Estado = Convert.ToBoolean(item["Estado"]),
                        DataCadastro = Convert.ToDateTime(item["DataCadastro"])
                    };
                    roles.Add(role);
                }
                return roles;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public List<Role> SelecionarTodos()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable perfil = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Perfil_CarregarTodos");
                List<Role> roles = new List<Role>();
                foreach (DataRow item in perfil.Rows)
                {
                    Role role = new Role
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        Name = Convert.ToString(item["Name"]),
                        Estado = Convert.ToBoolean(item["Estado"]),
                        DataCadastro = Convert.ToDateTime(item["DataCadastro"]),
                    };
                    roles.Add(role);
                }

                return roles;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public List<Role> SelecionarTodosActivos()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable perfil = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Perfil_CarregarActivos");
                List<Role> roles = new List<Role>();
                foreach (DataRow item in perfil.Rows)
                {
                    Role role = new Role
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        Name = Convert.ToString(item["Name"]),
                        Estado = Convert.ToBoolean(item["Estado"]),
                        DataCadastro = Convert.ToDateTime(item["DataCadastro"]),
                    };
                    roles.Add(role);
                }

                return roles;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public List<Role> CarregarPorUsuario(int userId)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserId", userId);
                var res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_PerfilDoUsuario");
                List<Role> roles = new List<Role>();
                foreach (DataRow item in res.Rows)
                {
                    Role role = new Role
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        Name = Convert.ToString(item["Name"])
                    };
                    roles.Add(role);
                }

                return roles;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public string BuscarPerfilDoUsuario(string username)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@UserName", username);
                var res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_BuscarPerfilDoUsuario");
                string perfis = "";
                foreach (DataRow item in res.Rows)
                {
                    perfis = Convert.ToString(item["Name"]);
                }

                return perfis;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public int UsuarioAtivoNoPerfil(int perfilId)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@PerfilId", perfilId);
                DataTable res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Perfil_UsuarioAtivos");
                int Qtde = 0;
                foreach (DataRow item in res.Rows)
                {
                    Qtde = Convert.ToInt32(item["Qtde"]);
                }

                return Qtde;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;

            }
        }
        public int UsuarioInativoNoPerfil(int perfilId)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@PerfilId", perfilId);
                DataTable res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Perfil_UsuarioInativos");
                int Qtde = 0;
                foreach (DataRow item in res.Rows)
                {
                    Qtde = Convert.ToInt32(item["Qtde"]);
                }
                return Qtde;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;

            }
        }
    }
}