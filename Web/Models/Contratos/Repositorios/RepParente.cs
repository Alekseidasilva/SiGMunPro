using Infra.Data;
using System;
using System.Collections.Generic;
using System.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades;
using Web.Models.Entidades.Municipe;

namespace Web.Models.Contratos.Repositorios
{
    public class RepParente : IParente
    {private readonly Conexao _conexao = new Conexao();
        public string Alterar(Parente entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNm", entidade.MunicipeNm);
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
                 _conexao.AdicionarParametros("@MunicipeGrauParentescoId", entidade.MunicipeGrauParentescoId);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_ParenteAlterar").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public Parente BuscarEntidadePelonM(string nM)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@nM", nM);
                DataTable res = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_ParenteBuscarPeloNm");
                Parente parente = new Parente();
                foreach (DataRow item in res.Rows)
                {
                    parente.Id = Convert.ToInt32(item["MunicipeId"]);
                    parente.MunicipeNm = Convert.ToString(item["MunicipeNM"]);
                    parente.Nome = Convert.ToString(item["MunicipeNomeCompleto"]);
                    parente.MunicipeDataNascimento = Convert.ToDateTime(item["MunicipeDataNascimento"]);
                    parente.MunicipeNDocIdent = Convert.ToString(item["MunicipeNDocIdent"]);
                    parente.MunicipeTipoDocIdentificacao = Convert.ToInt32(item["MunicipeTipoDocIdentificacao"]);
                    parente.MunicipeDocDataEmissao = Convert.ToDateTime(item["MunicipeDocDataEmissao"]);
                    parente.MunicipeDocDataValidade = Convert.ToDateTime(item["MunicipeDocDataValidade"]);
                    parente.MunicipeNif = Convert.ToString(item["MunicipeNIF"]);
                    parente.MunicipeGenero = Convert.ToInt32(item["MunicipeGenero"]);
                    parente.MunicipeEstadoCivil = Convert.ToInt32(item["MunicipeEstadoCivil"]);
                    parente.MunicipeTelefone1 = Convert.ToString(item["MunicipeTelefone1"]);
                    parente.MunicipeTelefone2 = Convert.ToString(item["MunicipeTelefone2"]);
                    parente.MunicipeEmail = Convert.ToString(item["MunicipeEmail"]);
                    parente.DataCadastro = Convert.ToDateTime(item["MunicipeDataCadastro"]);
                    parente.MunicipeFoto = Convert.ToString(item["MunicipeFoto"]);
                    parente.Estado = Convert.ToBoolean(item["MunicipeEstado"]);
                    parente.MunicipeGrauParentescoId = Convert.ToInt32(item["MunicipeGrauParentescoId"]);
                    parente.Idcadastrador = Convert.ToInt32(item["IdCadastrador"]);
                }
                return parente;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public Parente BuscarEntidadePorId(int id)
        {
            throw new NotImplementedException();
        }

        public List<Parente> BuscarListaPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        

        public string Cadastrar(Parente entidade)
        {
            throw new NotImplementedException();
        }

        public string CadstrarJaCadastrado(Parente parente)
        {
            throw new NotImplementedException();
        }

        public string CadstrarNovo(ParenteMorada parenteMorada)
        {

            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Titular", parenteMorada.MunicipeNm);
                _conexao.AdicionarParametros("@MunicipeNomeCompleto", parenteMorada.Nome);
                _conexao.AdicionarParametros("@MunicipeDataNascimento", parenteMorada.MunicipeDataNascimento);
                _conexao.AdicionarParametros("@MunicipeNDocIdent", parenteMorada.MunicipeNDocIdent);
                _conexao.AdicionarParametros("@MunicipeTipoDocIdentificacao", parenteMorada.MunicipeTipoDocIdentificacao);
                _conexao.AdicionarParametros("@MunicipeDocDataEmissao", parenteMorada.MunicipeDocDataEmissao);
                _conexao.AdicionarParametros("@MunicipeDocDataValidade", parenteMorada.MunicipeDocDataValidade);
                _conexao.AdicionarParametros("@MunicipeNIF", parenteMorada.MunicipeNif);
                _conexao.AdicionarParametros("@MunicipeGenero", parenteMorada.MunicipeGenero);
                _conexao.AdicionarParametros("@MunicipeEstadoCivil", parenteMorada.MunicipeEstadoCivil);
                _conexao.AdicionarParametros("@MunicipeTelefone1", parenteMorada.MunicipeTelefone1);
                _conexao.AdicionarParametros("@MunicipeTelefone2", parenteMorada.MunicipeTelefone2);
                _conexao.AdicionarParametros("@MunicipeEmail", parenteMorada.MunicipeEmail);
                _conexao.AdicionarParametros("@MunicipeFoto", parenteMorada.MunicipeFoto);
                _conexao.AdicionarParametros("@IdCadastrador", parenteMorada.Idcadastrador);


                _conexao.AdicionarParametros("@MoradaCasaNumero", parenteMorada.MoradaCasaN);
                _conexao.AdicionarParametros("@MoradaZona", parenteMorada.MoradaZona);
                _conexao.AdicionarParametros("@MoradaRuaId", parenteMorada.MoradaRuaId);

                _conexao.AdicionarParametros("@MunicipeGrauParentescoId", parenteMorada.MunicipeGrauParentescoId);

                string parente = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Parente_CadastrarNovo").ToString();
                return parente;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string Excluir(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Parente> ListarPeloNm(string nM)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNm", nM);
                DataTable p = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_Parente_ListarPeloNm");
                List<Parente> parentes = new List<Parente>();
                foreach (DataRow linha in p.Rows)
                {
                    Parente par = new Parente
                    {
                        Id=Convert.ToInt32(linha["MunicipeId"]),
                        MunicipeNm=Convert.ToString(linha["MunicipeNM"]),   
                        MunicipeParenteNm=Convert.ToString(linha["MunicipeParenteNM"]),
                        Nome=Convert.ToString(linha["MunicipeNomeCompleto"]),
                        MunicipeDataNascimento=Convert.ToDateTime(linha["MunicipeDataNascimento"]),
                        MunicipeNDocIdent=Convert.ToString(linha["MunicipeNDocIdent"]),
                        MunicipeTipoDocIdentificacao=Convert.ToInt32(linha["MunicipeTipoDocIdentificacao"]),
                        MunicipeDocDataEmissao=Convert.ToDateTime(linha["MunicipeDocDataEmissao"]),
                        MunicipeDocDataValidade=Convert.ToDateTime(linha["MunicipeDocDataValidade"]),
                        MunicipeGrauParentescoId=Convert.ToInt32(linha["MunicipeGrauParentescoId"]),
                        MunicipeNif=Convert.ToString(linha["MunicipeNIF"]),
                        MunicipeGenero=Convert.ToInt32(linha["MunicipeGenero"]),
                        MunicipeEstadoCivil=Convert.ToInt32(linha["MunicipeEstadoCivil"]),
                        MunicipeTelefone1=Convert.ToString(linha["MunicipeTelefone1"]),
                        MunicipeTelefone2=Convert.ToString(linha["MunicipeTelefone2"]),
                        MunicipeEmail=Convert.ToString(linha["MunicipeEmail"]),
                        MunicipeFoto=Convert.ToString(linha["MunicipeFoto"]),
                        Estado = Convert.ToBoolean(linha["MunicipeEstado"]),                      
                        DataCadastro = Convert.ToDateTime(linha["MunicipeDataCadastro"]),
                        Idcadastrador = Convert.ToInt32(linha["IdCadastrador"])
                    };
                    parentes.Add(par);
                }

                return parentes;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<Parente> SelecionarTodos()
        {
            throw new System.NotImplementedException();
        }
    }
}