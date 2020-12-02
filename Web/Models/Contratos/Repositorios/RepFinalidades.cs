using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades.Outras;

namespace Web.Models.Contratos.Repositorios
{
    public class RepFinalidades:IFinalidades
    {private readonly Conexao _conexao = new Conexao();
        public string Cadastrar(Finalidades entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Alterar(Finalidades entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Finalidades> BuscarListaPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public Finalidades BuscarEntidadePorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Finalidades> SelecionarTodos()
        {
            throw new System.NotImplementedException();
        }

        public string BuscarNomePeloId(int id)
        {
            try
                {
                    _conexao.LimparParametro();
                    _conexao.AdicionarParametros("@id", id);
                    var nome = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_FinalidadesBuscarNomePeloId");
                    string userName = "";
                    foreach (DataRow item in nome.Rows)
                    {
                        userName = Convert.ToString(item["FinalidadeNome"]);
                    }

                    return userName;
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw;
                }
            }

        public List<Finalidades> SelecionarTodosActivosPeloTipoDeDocumento(int id)
        {
            try
            {
                _conexao.LimparParametro();
                DataTable m = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_DocsFinalidadeCarregarActivosPorTipoDocumento");
                List<Finalidades> fins = new List<Finalidades>();
                foreach (DataRow linha in m.Rows)
                {
                    Finalidades fin = new Finalidades()
                    {
                        Id = Convert.ToInt32(linha["FinalidadeId"]),
                        Nome = Convert.ToString(linha["FinalidadeNome"]),
                        FinalidadeTipoDocumentoId = Convert.ToInt32(linha["FinalidadeTipoDocumento"]),
                        FinalidadeValor = Convert.ToDecimal(linha["FinalidadeValor"]),
                        Estado = Convert.ToBoolean(linha["FinalidadeEstado"]),
                        Idcadastrador = Convert.ToInt32(linha["IdCadastrador"])
                    };
                    fins.Add(fin);
                }

                return fins;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
    
}