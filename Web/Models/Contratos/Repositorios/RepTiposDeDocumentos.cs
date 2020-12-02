using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades.Outras;

namespace Web.Models.Contratos.Repositorios
{
    public class RepTiposDeDocumentos:ITiposDeDocumentos
    {private readonly Conexao _conexao = new Conexao();
        public string Cadastrar(TiposDeDocumentos entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Alterar(TiposDeDocumentos entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<TiposDeDocumentos> BuscarListaPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public TiposDeDocumentos BuscarEntidadePorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<TiposDeDocumentos> SelecionarTodos()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable m = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "");
                List<TiposDeDocumentos> tiposDeDocumentoses = new List<TiposDeDocumentos>();
                foreach (DataRow linha in m.Rows)
                {
                    TiposDeDocumentos doc = new TiposDeDocumentos()
                    {
                        Id = Convert.ToInt32(linha[""]),
                        Nome = Convert.ToString(linha[""]),
                        Estado = Convert.ToBoolean(linha[""]),
                        DataCadastro = Convert.ToDateTime(linha[""]),
                        Idcadastrador = Convert.ToInt32(linha[""])
                    };
                    tiposDeDocumentoses.Add(doc);
                }

                return tiposDeDocumentoses;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string BuscarNomePeloId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@id", id);
                var nome = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_TiposDeDocumentosBuscarNomePeloId");
                string userName = "";
                foreach (DataRow item in nome.Rows)
                {
                    userName = Convert.ToString(item["DocumentoNome"]);
                }

                return userName;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<TiposDeDocumentos> SelecionarTodosActivos()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable m = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_TiposDeDocumentoCarregarActivos");
                List<TiposDeDocumentos> tiposDeDocumentoses = new List<TiposDeDocumentos>();
                foreach (DataRow linha in m.Rows)
                {
                    TiposDeDocumentos doc = new TiposDeDocumentos()
                    {
                        Id = Convert.ToInt32(linha["DocumentoId"]),
                        Nome = Convert.ToString(linha["DocumentoNome"]),
                        Estado = Convert.ToBoolean(linha["DocumentoEstado"]),
                        Idcadastrador = Convert.ToInt32(linha["DocumentoUsuarioId"])
                    };
                    tiposDeDocumentoses.Add(doc);
                }

                return tiposDeDocumentoses;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
    
}