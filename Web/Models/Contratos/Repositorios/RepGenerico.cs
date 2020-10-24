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
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@id", id);
                DataTable tbMunicipios = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarBairrosPorComuna");
                List<Bairros> bairros = new List<Bairros>();
                foreach (DataRow itens in tbMunicipios.Rows)
                {
                    Bairros b = new Bairros()
                    {
                        Id = Convert.ToInt32(itens["BairroId"]),
                        Nome = Convert.ToString(itens["BairroNome"])
                    };
                    bairros.Add(b);
                }
                return bairros;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        #endregion
        #region Comunas

        public List<Comunas> CarregarComunaPorMunicipio(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@id", id);
                DataTable tbMunicipios = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarComunasPorMunicipio");
                List<Comunas> comunas = new List<Comunas>();
                foreach (DataRow itens in tbMunicipios.Rows)
                {
                    Comunas c = new Comunas
                    {
                        Id = Convert.ToInt32(itens["ComunaId"]),
                        Nome = Convert.ToString(itens["ComunaNome"])
                    };
                    comunas.Add(c);
                }
                return comunas;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
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

        #region TiposDocumentos

        public List<TiposDocumentosIdentificacao> SelecionarTodosTiposDocumentoIdentificacao()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable perfil = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarTipoDocIdentificacao");
                List<TiposDocumentosIdentificacao> tiposDocumentos = new List<TiposDocumentosIdentificacao>();
                foreach (DataRow item in perfil.Rows)
                {
                    TiposDocumentosIdentificacao identificacao = new TiposDocumentosIdentificacao
                    {
                        Id = Convert.ToInt32(item["Id"]),
                        Nome = Convert.ToString(item["Nome"]),
                    };
                    tiposDocumentos.Add(identificacao);
                }

                return tiposDocumentos;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        #endregion



        #region Municipios

        public List<Municipios> CarregarMunicipiosPorProvincia(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@id",id);
               DataTable tbMunicipios= _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarMunicipiosPorProvincia");
              List<Municipios> municipios = new List<Municipios>();
               foreach (DataRow itens in tbMunicipios.Rows)
               {
                   Municipios m =new Municipios
                   {
                       Id = Convert.ToInt32(itens["MunicipioId"]),
                       Nome = Convert.ToString(itens["MunicipioNome"])
                   };
                    municipios.Add(m);
               }
               return municipios;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            
            
        }

        #endregion

    }
}