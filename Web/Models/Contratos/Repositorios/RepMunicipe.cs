using Infra.Data;
using System;
using System.Collections.Generic;
using System.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades.Municipe;

namespace Web.Models.Contratos.Repositorios
{
    public class RepMunicipe : IMunicipe
    {
        public readonly Conexao _conexao = new Conexao();
       
        public string Alterar(Municipe entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id", entidade.Id);
                _conexao.AdicionarParametros("@MunicipeNomeCompleto", entidade.Nome);
                _conexao.AdicionarParametros("@MunicipeDataNascimento", entidade.MunicipeDataNascimento);
                _conexao.AdicionarParametros("@MunicipeNDocIdent", entidade.MunicipeNDocIdent);
                _conexao.AdicionarParametros("@MunicipeTipoDocIdentificacao", entidade.MunicipeTipoDocIdentificacao);
                _conexao.AdicionarParametros("@MunicipeDocDataEmissao", entidade.MunicipeDocDataEmissao);
                _conexao.AdicionarParametros("@MunicipeDocDataValidade", entidade.MunicipeDocDataValidade);
                _conexao.AdicionarParametros("@MunicipeNIF", entidade.MunicipeNif);
                _conexao.AdicionarParametros("@MunicipeGenero", entidade.MunicipeGenero);
                _conexao.AdicionarParametros("@MunicipeEstadoCivil", entidade.MunicipeEstadoCivil);
                _conexao.AdicionarParametros("@MunicipeTelefone1", entidade.MunicipeTelefone1);
                _conexao.AdicionarParametros("@MunicipeTelefone2", entidade.MunicipeTelefone2);
                _conexao.AdicionarParametros("@MunicipeEmail", entidade.MunicipeEmail);
                _conexao.AdicionarParametros("@MunicipeFoto", entidade.MunicipeFoto);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Municipe_Alterar").ToString();

                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public Municipe BuscarEntidadePorId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id", id);
                DataTable res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Municipe_BuscarPorId");
                Municipe municipe = new Municipe();
                foreach (DataRow item in res.Rows)
                {
                    municipe.Id = Convert.ToInt32(item["MunicipeId"]);
                    municipe.MunicipeNm = Convert.ToString(item["MunicipeNM"]);
                    municipe.Nome = Convert.ToString(item["MunicipeNomeCompleto"]);
                    municipe.MunicipeDataNascimento = Convert.ToDateTime(item["MunicipeDataNascimento"]);
                    municipe.MunicipeNDocIdent = Convert.ToString(item["MunicipeNDocIdent"]);
                    municipe.MunicipeTipoDocIdentificacao = Convert.ToInt32(item["MunicipeTipoDocIdentificacao"]);
                    municipe.MunicipeDocDataEmissao = Convert.ToDateTime(item["MunicipeDocDataEmissao"]);
                    municipe.MunicipeDocDataValidade = Convert.ToDateTime(item["MunicipeDocDataValidade"]);
                    municipe.MunicipeNif = Convert.ToString(item["MunicipeNIF"]);
                    municipe.MunicipeGenero = Convert.ToInt32(item["MunicipeGenero"]);
                    municipe.MunicipeEstadoCivil = Convert.ToInt32(item["MunicipeEstadoCivil"]);
                    municipe.MunicipeTelefone1 = Convert.ToString(item["MunicipeTelefone1"]);
                    municipe.MunicipeTelefone2 = Convert.ToString(item["MunicipeTelefone2"]);
                    municipe.MunicipeEmail = Convert.ToString(item["MunicipeEmail"]);
                    municipe.DataCadastro = Convert.ToDateTime(item["MunicipeDataCadastro"]);
                    municipe.MunicipeFoto = Convert.ToString(item["MunicipeFoto"]);
                    municipe.Estado = Convert.ToBoolean(item["MunicipeEstado"]);
                    municipe.Idcadastrador = Convert.ToInt32(item["IdCadastrador"]);
                }
                return municipe;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<Municipe> BuscarListaPorNome(string nome)
        {
            throw new NotImplementedException();
        }

        public string Cadastrar(MunicipeMorada entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNomeCompleto", entidade.Nome);
                _conexao.AdicionarParametros("@MunicipeDataNascimento", entidade.MunicipeDataNascimento);
                _conexao.AdicionarParametros("@MunicipeNDocIdent", entidade.MunicipeNDocIdent);
                _conexao.AdicionarParametros("@MunicipeTipoDocIdentificacao", entidade.MunicipeTipoDocIdentificacao);
                _conexao.AdicionarParametros("@MunicipeDocDataEmissao", entidade.MunicipeDocDataEmissao);
                _conexao.AdicionarParametros("@MunicipeDocDataValidade", entidade.MunicipeDocDataValidade);
                _conexao.AdicionarParametros("@MunicipeNIF", entidade.MunicipeNif);
                _conexao.AdicionarParametros("@MunicipeGenero", entidade.MunicipeGenero);
                _conexao.AdicionarParametros("@MunicipeEstadoCivil", entidade.MunicipeEstadoCivil);
                _conexao.AdicionarParametros("@MunicipeTelefone1", entidade.MunicipeTelefone1);
                _conexao.AdicionarParametros("@MunicipeTelefone2", entidade.MunicipeTelefone2);
                _conexao.AdicionarParametros("@MunicipeEmail", entidade.MunicipeEmail);
                _conexao.AdicionarParametros("@MunicipeFoto", entidade.MunicipeFoto);
                _conexao.AdicionarParametros("@IdCadastrador", entidade.Idcadastrador);


                _conexao.AdicionarParametros("@MoradaCasaNumero", entidade.MoradaCasaN);
                _conexao.AdicionarParametros("@MoradaZona", entidade.MoradaZona);
                _conexao.AdicionarParametros("@MoradaRuaId", entidade.MoradaRuaId);
                string mun = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Municipe_Inserir").ToString();
                return mun;
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
                        MunicipeNm = Convert.ToString(item["MunicipeNM"]),
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
                        DataCadastro = Convert.ToDateTime(item["MunicipeDataCadastro"]),
                        MunicipeFoto = Convert.ToString(item["MunicipeFoto"]),
                        Estado = Convert.ToBoolean(item["MunicipeEstado"]),
                        Idcadastrador = Convert.ToInt32(item["IdCadastrador"]),
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
       
        public string BuscarNomePeloId(string id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNm", id);
                DataTable nome = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_MunicipeBuscarNome");
                string nomeEncontrado = "";
                foreach (DataRow item in nome.Rows)
                {
                    nomeEncontrado = Convert.ToString(item["MunicipeNomeCompleto"]);
                }
                return nomeEncontrado;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public int TotalMunicipesCadastrados()
        {
            try
            {
                _conexao.LimparParametro();
                var Total = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_MunicipeTotalCadastrados");
                int nTotal = 0;
                foreach (DataRow item in Total.Rows)
                {
                    nTotal = Convert.ToInt32(item["Qtde"]);
                }
                return nTotal;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string Cadastrar(Municipe entidade)
        {
            throw new NotImplementedException();
        }
    }
}
