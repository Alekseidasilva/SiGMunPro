using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades.Locais;

namespace Web.Models.Contratos.Repositorios
{
    public class RepMorada : IMorada
    {
       private readonly Conexao _conexao = new Conexao();
        
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
              _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_MoradaInserir");
                return String.Empty;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public string Alterar(Moradas entidade)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MoradaMunicuipeNM",entidade.MoradaMunicuipeNm);
                _conexao.AdicionarParametros("@MoradaZona",entidade.MoradaZona);
                _conexao.AdicionarParametros("@MoradaRuaId",entidade.MoradaRuaId);
                _conexao.AdicionarParametros("@MoradaCasaNumero",entidade.MoradaCasaN);                
                _conexao.ExecutarManipulacao(CommandType.StoredProcedure, "SP_Morada_Alterar");
                return string.Empty;
            }
            catch (Exception e)
            {

                throw;
            }
        }

        public List<Moradas> BuscarListaPorNome(string nome)
        {
            throw new NotImplementedException();
        }

        public Moradas BuscarEntidadePorId(int id)
        {
            throw new NotImplementedException();
        }

        public string[] CarregarLocais(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@RuaId",id);
                DataTable locais = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_MoradaCarregarNomesLocais");
                string[] Elementos = new[] {"", "", "",""};
                foreach (DataRow elemento in locais.Rows)
                {
                    Elementos[0] = Convert.ToString(elemento["RuaNome"]);
                    Elementos[1] = Convert.ToString(elemento["BairroNome"]);
                    Elementos[2] = Convert.ToString(elemento["ComunaNome"]);
                    Elementos[3] = Convert.ToString(elemento["MunicipioNome"]);
                }

                return Elementos;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public List<Moradas> SelecionarTodos()
        {
            throw new System.NotImplementedException();
        }

        public List<Moradas> CarregarMoradasPorNm(string nM)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNm",nM);
                DataTable m = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_MoradasCarregarPorNm");
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
        public Moradas CarregarMoradaPorNm(string nM)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipeNm", nM);             
                DataTable m = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_MoradaCarregarPorNm");
                Moradas mor = new Moradas();
                foreach (DataRow linha in m.Rows)
                {
                    mor.MoradaMunicuipeNm = Convert.ToString(linha["MoradaMunicuipeNM"]);
                    mor.MoradaCasaN = Convert.ToString(linha["MoradaCasaNumero"]);
                    mor.MoradaZona = Convert.ToString(linha["MoradaZona"]);
                    mor.Estado = Convert.ToBoolean(linha["MoradaEstado"]);
                    mor.MoradaRuaId = Convert.ToInt32(linha["MoradaRuaId"]);
                    mor.DataCadastro = Convert.ToDateTime(linha["MoradaDataCadastro"]);
                    mor.Idcadastrador = Convert.ToInt32(linha["IdCadastrador"]);
                }

                return mor;
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
    }
}