using Infra.Data;
using MVC.Models.Contratos.Interfaces;
using MVC.Models.Entidades.Municipe;
using System;
using System.Collections.Generic;
using System.Data;

namespace MVC.Models.Contratos.Repositorios
{
    public class RepMunicipe : IMunicipe
    {
        private readonly Conexao _conexao = new Conexao();
        public string Cadastrar(Municipe entidade)
        {
            string res;
            throw new NotImplementedException();
        }

        public string Alterar(Municipe entidade)
        {
            throw new NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public List<Municipe> BuscarPorNome(string nome)
        {
            throw new NotImplementedException();
        }

        public Municipe BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public List<Municipe> SelecionarTodos()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Municipe_CarregarTodos");

                List<Municipe> municipes = new List<Municipe>();
                foreach (DataRow item in res.Rows)
                {
                    Municipe municipe = new Municipe
                    {
                        Id = Convert.ToInt32(item["MunicipeId"]),
                        MunicipeNm = Convert.ToInt64(item["MunicipeNM"]),
                        Nome = Convert.ToString(item["MunicipeNomeCompleto"]),
                        MunicipeDataNascimento = Convert.ToDateTime(item["MunicipeDataNascimento"]),
                        MunicipeNDocIdent = Convert.ToString(item["MunicipeNDocIdent"]),
                        MunicipeTipoDocIdentificacao = Convert.ToInt32(item["MunicipeTipoDocIdentificacao"]),
                        MunicipeDocDataEmissao = Convert.ToDateTime(item["MunicipeDocDataEmissao"]),
                        MunicipeDocDataValidade = Convert.ToDateTime(item["MunicipeDocDataValidade"]),
                        MunicipeNif = Convert.ToString(item["MunicipeNIF"]),
                        MunicipeGenero = Convert.ToInt32(item["MunicipeGenero"]),
                        MunicipeEstadoCivil = Convert.ToInt32(item["MunicipeEstadoCivil"]),
                        MunicipeTelefone1 = Convert.ToString(item["MunicipeTelefone1"]),
                        MunicipeTelefone2 = Convert.ToString(item["MunicipeTelefone2"]),
                        MunicipeEmail = Convert.ToString(item["MunicipeEmail"]),

                        Estado = Convert.ToBoolean(item["MunicipeEstado"]),
                        Idcadastrador = Convert.ToInt32(item["IdCadastrador"])
                    };
                    municipes.Add(municipe);
                }

                return municipes;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}