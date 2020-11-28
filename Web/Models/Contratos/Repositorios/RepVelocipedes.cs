﻿using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades;
using Web.Models.Entidades.Locais;

namespace Web.Models.Contratos.Repositorios
{
    public class RepVelocipedes:IVelocipedes
    {
        private readonly Conexao _conexao = new Conexao();
        public string Cadastrar(Velocipedes entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@VelocipedeMunicipeNM",entidade.VelocipeMunicipeNm);
                _conexao.AdicionarParametros("@VelocipedeNLivrete",entidade.VelocipeNLivrete);
                _conexao.AdicionarParametros("@VelocipedeNChapa",entidade.VelocipeNChapa);
                _conexao.AdicionarParametros("@VelocipedeMarca",entidade.VelocipeMarca);
                _conexao.AdicionarParametros("@VelocipeModelo",entidade.VelocipeModelo);
                _conexao.AdicionarParametros("@VelocipedeNQuadro",entidade.VelocipeNQuadro);
                _conexao.AdicionarParametros("@VelocipedeCom_S_Motor",entidade.VelocipeComSMotor);
                _conexao.AdicionarParametros("@VelocipedeNMotor",entidade.VelocipeNMotor);
                _conexao.AdicionarParametros("@VelocipedeDestinadoServico",entidade.VelocipeDestinoServico);
                _conexao.AdicionarParametros("@VelocipedeCilindragem",entidade.VelocipeCilindragem);
                _conexao.AdicionarParametros("@VelocipedeCor",entidade.VelocipeCor);
                _conexao.AdicionarParametros("@VelocipedeEstado",entidade.Estado);
                _conexao.AdicionarParametros("@VelocipeDataCadastro",entidade.DataCadastro);
                _conexao.AdicionarParametros("@IdCadastrador",entidade. Idcadastrador);
                string res = _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_VeiculosCadastrar").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string Alterar(Velocipedes entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Velocipedes> BuscarListaPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public Velocipedes BuscarEntidadePorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Velocipedes> SelecionarTodos()
        {
            throw new System.NotImplementedException();
        }

        public List<Velocipedes> CarregarPeloNm(string nM)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNm", nM);
                DataTable v = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_VelocipedesCarregarTodosPeloNm");
                List<Velocipedes> velocipedeses = new List<Velocipedes>();
                foreach (DataRow linha in v.Rows)
                {
                    Velocipedes vel = new Velocipedes
                    {
                        Id = Convert.ToInt32(linha["VelocipedeId"]),
                        VelocipeMunicipeNm = Convert.ToString(linha["VelocipedeMunicipeNM"]),
                        VelocipeNLivrete = Convert.ToString(linha["VelocipedeNLivrete"]),
                        VelocipeNChapa = Convert.ToString(linha["VelocipedeNChapa"]),
                        VelocipeMarca = Convert.ToInt32(linha["VelocipedeMarca"]),
                        VelocipeModelo = Convert.ToInt32(linha["VelocipeModelo"]),
                        VelocipeNQuadro = Convert.ToString(linha["VelocipedeNQuadro"]),
                        VelocipeComSMotor = Convert.ToBoolean(linha["VelocipedeCom_S_Motor"]),
                        VelocipeNMotor = Convert.ToString(linha["VelocipedeNMotor"]),
                        VelocipeDestinoServico = Convert.ToString(linha["VelocipedeDestinadoServico"]),
                        VelocipeCilindragem = Convert.ToString(linha["VelocipedeCilindragem"]),
                        VelocipeCor = Convert.ToString(linha["VelocipedeCor"]),
                        Estado = Convert.ToBoolean(linha["VelocipedeEstado"]),
                        DataCadastro = Convert.ToDateTime(linha["VelocipeDataCadastro"]),
                        Idcadastrador = Convert.ToInt32(linha["IdCadastrador"])
                    };
                    velocipedeses.Add(vel);
                }

                return velocipedeses;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public int TotalCadastrados()
        {
            try
            {
                _conexao.LimparParametro();
                var Total = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_VeiculosTotalCadastrados");
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
    }
}