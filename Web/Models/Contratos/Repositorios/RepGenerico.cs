using Infra.Data;
using System;
using System.Collections.Generic;
using System.Data;
using Web.Models.Entidades;
using Web.Models.Entidades.Locais;
using Web.Models.Entidades.Outras;

namespace Web.Models.Contratos.Repositorios
{
    public class RepGenerico
    {

        private readonly Conexao _conexao = new Conexao();
        #region Genero
        public List<Genero> CarregarGeneros()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable resConsulta = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarGeneros");
                List<Genero> gerenos = new List<Genero>();
                foreach (DataRow item in resConsulta.Rows)
                {
                    Genero genero=new Genero
                    {
                        Id = Convert.ToInt32(item["GeneroId"]),
                        Nome = Convert.ToString(item["GeneroNome"])
                    };
                }
                return gerenos;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public string CarregarGenerosPorId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id", id);
                DataTable genero = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarGeneroPorId");
                string gereros = "";
                foreach (DataRow item in genero.Rows)
                {
                    gereros = Convert.ToString(item["generoNome"]);
                }
                return gereros;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        #endregion
        #region EstadoCivil
        public List<EstadoCivil> CarregarEstadoCivil()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable Result = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarEstadoCivil");
                List<EstadoCivil> estadoCivils = new List<EstadoCivil>();
                foreach (DataRow item in Result.Rows)
                {
                    EstadoCivil estadoCivil=new EstadoCivil
                    {
                        Id = Convert.ToInt32(item["EstadoCivilId"]),
                        Nome =Convert.ToString(item["EstadoCivilNome"])
                    };
                    estadoCivils.Add(estadoCivil);

                }
                return estadoCivils;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public string CarregarEstadoCivilPorId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id", id);
                DataTable EstadoCivil = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarEstadoCivilPorId");
                string estadocivil = "";
                foreach (DataRow item in EstadoCivil.Rows)
                {
                    estadocivil = Convert.ToString(item["EstadoCivilNome"]);
                }
                return estadocivil;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        #endregion

        #region Moradas

        public void CadastarMorada(Moradas moradas)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("", moradas.MoradaMunicuipeNm);
                _conexao.AdicionarParametros("", moradas.MoradaCasaN);
                _conexao.AdicionarParametros("", moradas.MoradaRua);
                _conexao.AdicionarParametros("", moradas.MoradaZona);
                _conexao.AdicionarParametros("", moradas.MoradaBairroId);
                _conexao.AdicionarParametros("", moradas.DataCadastro);
                _conexao.AdicionarParametros("",moradas.Estado);
                _conexao.AdicionarParametros("",moradas.Idcadastrador);

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            
        }
        public List<Moradas> CarregarMoradas()
        {
            List<Moradas> moradas = new List<Moradas>();
            return moradas;
        }
        public List<Moradas> CarregarMoradasPorNm(Int64 Nm)
        {
            List<Moradas>moradas=new List<Moradas>();
            return moradas;
        }

        #endregion
        #region Bairros

        public List<Bairros> CarregarBairrosPorComuna(int id)
        {
            List<Bairros> bairros = new List<Bairros>();
            return bairros;
        }

        #endregion
        #region Comunas

        public List<Comunas> CarregarComunaPorMunicipio(int id)
        {
            List<Comunas> comunas = new List<Comunas>();
            return comunas;
        }
        #endregion
        #region Velocipedes

        public void CadastrarVelocipede(Velocipedes velocipedes)
        {

        }
        public List<Comunas> CarregarVelocipedesPorMunicipe(Int64 nm)
        {
            
            List<Comunas> comunas = new List<Comunas>();
            return comunas;
        }
        #endregion
    }
}