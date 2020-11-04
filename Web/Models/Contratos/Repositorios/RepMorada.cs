using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades.Locais;

namespace Web.Models.Contratos.Repositorios
{
    public class RepMorada:IMorada
    {private readonly Conexao _conexao = new Conexao();
        
        public string Cadastrar(Moradas entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MoradaMunicuipeNM", entidade.MoradaMunicuipeNm);
                _conexao.AdicionarParametros("@MoradaCasaNumero", entidade.MoradaCasaN);
                _conexao.AdicionarParametros("@MoradaZona", entidade.MoradaZona);
                _conexao.AdicionarParametros("@MoradaRuaId", entidade.MoradaRuaId);
                _conexao.AdicionarParametros("@MoradaDataCadastro", entidade.DataCadastro);
                _conexao.AdicionarParametros("@MoradaEstado", entidade.Estado);
                _conexao.AdicionarParametros("@IdCadastrador", entidade.Idcadastrador);
               string res= _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_MoradaInserir").ToString();
                return res;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string Alterar(Moradas entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Moradas> BuscarPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public Moradas BuscarPorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<Moradas> SelecionarTodos()
        {
            throw new System.NotImplementedException();
        }

        public List<Moradas> CarregarPorNm(string nM)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNm",nM);
                DataTable m = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_MoradaCarregarPorNm");
               List<Moradas>moradas=new List<Moradas>();
                foreach (DataRow linha in m.Rows)
                {
                    Moradas mor=new Moradas
                    {   MoradaMunicuipeNm = Convert.ToString(linha["MoradaMunicuipeNM"]),
                        MoradaCasaN = Convert.ToString(linha["MoradaCasaNumero"]),
                        MoradaZona = Convert.ToString(linha["MoradaZona"]),
                        Estado = Convert.ToBoolean(linha["MoradaEstado"]),
                        MoradaRuaId = Convert.ToInt32(linha["MoradaRuaId"]),
                        DataCadastro = Convert.ToDateTime(linha["MoradaDataCadastro"]),
                        Idcadastrador = Convert.ToInt32(linha["IdCadastrador"])
                    };
                    moradas.Add(mor);
                }

                return moradas;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}