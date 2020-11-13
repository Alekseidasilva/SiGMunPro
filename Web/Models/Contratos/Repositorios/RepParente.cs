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
            throw new System.NotImplementedException();
        }

        public Parente BuscarEntidadePorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Parente> BuscarListaPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public string Cadastrar(Parente entidade)
        {
            throw new System.NotImplementedException();
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