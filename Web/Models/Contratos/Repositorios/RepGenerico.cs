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
                    gerenos.Add(genero);
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
        #region Ruas
        public List<Rua> CarregarRuasPorBairros(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@BairroID", id);
                DataTable Ruas = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarRuasPorBairro");
                List<Rua> ruas = new List<Rua>();
                foreach (DataRow itens in Ruas.Rows)
                {
                    Rua r = new Rua()
                    {
                        Id = Convert.ToInt32(itens["RuaId"]),
                        Nome = Convert.ToString(itens["RuaNome"]),
                        RuaBairroId = Convert.ToInt32(itens["RuaBairroId"])
                    };
                    ruas.Add(r);
                }
                return ruas;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public List<Rua> CarregarRuas()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable ruaS = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "");
                List<Rua> ruas = new List<Rua>();
                foreach (DataRow itens in ruaS.Rows)
                {
                    Rua r = new Rua()
                    {
                        Id = Convert.ToInt32(itens[""]),
                        Nome = Convert.ToString(itens[""]),
                        RuaBairroId = Convert.ToInt32(itens[""])
                    };
                    ruas.Add(r);
                }
                return ruas;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
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
        public string CarregarTipoDocPorId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@TipoDocId", id);
                DataTable tipoDoc =_conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarTipoDocIdentPorId");
                string tipoNome = "";
                foreach (DataRow itens in tipoDoc.Rows)
                {
                    foreach (DataRow item in tipoDoc.Rows)
                    {
                        tipoNome = Convert.ToString(item["Nome"]);
                    }
                }
                return tipoNome;
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
        #region GrauParentesco
        public List<GrauParentesco> CarregarGrauParentesco()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable resConsulta = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarGrauParentesco");
                List<GrauParentesco> graus = new List<GrauParentesco>();
                foreach (DataRow item in resConsulta.Rows)
                {
                    GrauParentesco grau = new GrauParentesco
                    {
                        Id = Convert.ToInt32(item["GrauParentescoId"]),
                        Nome = Convert.ToString(item["GrauParentescoIdNome"])
                    };
                    graus.Add(grau);
                }
                return graus;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public string CarregarGrauParentescoPeloNM(string MunicipenM)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@MunicipenM", MunicipenM);
                DataTable graus = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarGrauParentescoPeloNm");
                string grau = "";
                foreach (DataRow item in graus.Rows)
                {
                    grau = Convert.ToString(item["GrauParentescoIdNome"]);
                }
                return grau;
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