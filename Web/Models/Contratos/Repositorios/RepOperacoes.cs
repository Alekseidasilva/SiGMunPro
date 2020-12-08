using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades;

namespace Web.Models.Contratos.Repositorios
{
    public class RepOperacoes:IOperacoes
    {
        public readonly Conexao _conexao = new Conexao();


        #region Implemetados
        public string Executar(Operacoes operacoes)
        {
            throw new NotImplementedException();
        }

        public List<Operacoes> Pesquisar(string txtPesquisar)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@txtPesquisar",txtPesquisar);
                DataTable tbOp = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_OperacoesPesquisar");
                List<Operacoes> ops = new List<Operacoes>();
                foreach (DataRow item in tbOp.Rows)
                {
                    Operacoes op = new Operacoes
                    {
                        Id = Convert.ToInt32(item["OperacaoId"]),
                        OperacaoMunicipeNM = Convert.ToString(item["OperacaoMunicipeNM"]),
                        OperacaoTipoDocumentoId = Convert.ToInt32(item["OperacaoTipoDocumentoId"]),
                        OperacaoDocsFinalidadeId = Convert.ToInt32(item["OperacaoDocsFinalidadeId"]),
                        OperacaoFormaPagamentoId = Convert.ToInt32(item["OperacaoFormaPagamentoId"]),
                        OperacaoValorTotal = Convert.ToDecimal(item["OperacaoValorTotal"]),
                        DataCadastro = Convert.ToDateTime(item["OperacaoData"]),
                        Idcadastrador = Convert.ToInt32(item["IdCadastrador"]),

                    };
                    ops.Add(op);

                }

                return ops;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<Operacoes> OrdenarPeloNM()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable tbOp = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_OperacaoOrdenarPeloNM");
                List<Operacoes> ops = new List<Operacoes>();
                foreach (DataRow item in tbOp.Rows)
                {
                    Operacoes op = new Operacoes
                    {
                        Id = Convert.ToInt32(item["OperacaoId"]),
                        OperacaoMunicipeNM = Convert.ToString(item["OperacaoMunicipeNM"]),
                        OperacaoTipoDocumentoId = Convert.ToInt32(item["OperacaoTipoDocumentoId"]),
                        OperacaoDocsFinalidadeId = Convert.ToInt32(item["OperacaoDocsFinalidadeId"]),
                        OperacaoFormaPagamentoId = Convert.ToInt32(item["OperacaoFormaPagamentoId"]),
                        OperacaoValorTotal = Convert.ToDecimal(item["OperacaoValorTotal"]),
                        DataCadastro = Convert.ToDateTime(item["OperacaoData"]),
                        Idcadastrador = Convert.ToInt32(item["IdCadastrador"]),

                    };
                    ops.Add(op);

                }

                return ops;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<Operacoes> OrdenarPelTipoDocumento()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable tbOp = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_OperacaoOrdenarPeloTipoDeDocumento");
                List<Operacoes> ops = new List<Operacoes>();
                foreach (DataRow item in tbOp.Rows)
                {
                    Operacoes op = new Operacoes
                    {
                        Id = Convert.ToInt32(item["OperacaoId"]),
                        OperacaoMunicipeNM = Convert.ToString(item["OperacaoMunicipeNM"]),
                        OperacaoTipoDocumentoId = Convert.ToInt32(item["OperacaoTipoDocumentoId"]),
                        OperacaoDocsFinalidadeId = Convert.ToInt32(item["OperacaoDocsFinalidadeId"]),
                        OperacaoFormaPagamentoId = Convert.ToInt32(item["OperacaoFormaPagamentoId"]),
                        OperacaoValorTotal = Convert.ToDecimal(item["OperacaoValorTotal"]),
                        DataCadastro = Convert.ToDateTime(item["OperacaoData"]),
                        Idcadastrador = Convert.ToInt32(item["IdCadastrador"]),

                    };
                    ops.Add(op);

                }

                return ops;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<Operacoes> OrdenarPelaData()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable tbOp = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_OperacaoOrdenarPelaData");
                List<Operacoes> ops = new List<Operacoes>();
                foreach (DataRow item in tbOp.Rows)
                {
                    Operacoes op = new Operacoes
                    {
                        Id = Convert.ToInt32(item["OperacaoId"]),
                        OperacaoMunicipeNM = Convert.ToString(item["OperacaoMunicipeNM"]),
                        OperacaoTipoDocumentoId = Convert.ToInt32(item["OperacaoTipoDocumentoId"]),
                        OperacaoDocsFinalidadeId = Convert.ToInt32(item["OperacaoDocsFinalidadeId"]),
                        OperacaoFormaPagamentoId = Convert.ToInt32(item["OperacaoFormaPagamentoId"]),
                        OperacaoValorTotal = Convert.ToDecimal(item["OperacaoValorTotal"]),
                        DataCadastro = Convert.ToDateTime(item["OperacaoData"]),
                        Idcadastrador = Convert.ToInt32(item["IdCadastrador"]),

                    };
                    ops.Add(op);

                }

                return ops;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<Operacoes> SelecionarTodos()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable tbOp = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_OperacaoCarregarTodas");
                List<Operacoes> ops = new List<Operacoes>();
                foreach (DataRow item in tbOp.Rows)
                {
                    Operacoes op = new Operacoes
                    {
                        Id = Convert.ToInt32(item["OperacaoId"]),
                        OperacaoMunicipeNM = Convert.ToString(item["OperacaoMunicipeNM"]),
                        OperacaoTipoDocumentoId = Convert.ToInt32(item["OperacaoTipoDocumentoId"]),
                        OperacaoDocsFinalidadeId = Convert.ToInt32(item["OperacaoDocsFinalidadeId"]),
                        OperacaoFormaPagamentoId = Convert.ToInt32(item["OperacaoFormaPagamentoId"]),
                        OperacaoValorTotal = Convert.ToDecimal(item["OperacaoValorTotal"]),
                        DataCadastro = Convert.ToDateTime(item["OperacaoData"]),
                        Idcadastrador = Convert.ToInt32(item["IdCadastrador"]),

                    };
                    ops.Add(op);

                }

                return ops;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public decimal BuscarPrecoFinalidade(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@id", id);
                DataTable tb = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_FinalidadeCarregarValor");
                decimal valor = 0;
                foreach (DataRow linha in tb.Rows)
                {
                    valor = Convert.ToDecimal(linha["FinalidadeValor"]);
                }                
                return valor;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        #endregion
        #region Não Implementados
        public string Cadastrar(Operacoes entidade)
        {
            throw new NotImplementedException();
        }

        public string Alterar(Operacoes entidade)
        {
            throw new NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public List<Operacoes> BuscarListaPorNome(string nome)
        {
            throw new NotImplementedException();
        }

        public Operacoes BuscarEntidadePorId(int id)
        {
            throw new NotImplementedException();
        }

        



        #endregion



    }
}