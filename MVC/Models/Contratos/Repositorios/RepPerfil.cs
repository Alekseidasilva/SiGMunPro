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

        public Role BuscarPorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Role> BuscarPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public List<Role> SelecionarTodos()
        {
            try
            {
                _conexao.LimparParametro();
               DataTable perfil= _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Perfil_CarregarTodos");
               List<Role>roles=new List<Role>();
               foreach (DataRow item in perfil.Rows)
               {
                   Role role=new Role
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
                _conexao.AdicionarParametros("@UserId",userId);
                var res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_PerfilDoUsuario");
               List<Role>roles=new List<Role>();
                foreach (DataRow item in res.Rows)
                {Role role=new Role
                    {
                        Id =Convert.ToInt32(item["Id"]),
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
    }
}