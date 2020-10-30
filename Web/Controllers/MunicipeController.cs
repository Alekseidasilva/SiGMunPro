
using System.Collections.Generic;
using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Locais;
using Web.Models.Entidades.Municipe;

namespace Web.Controllers
{
    [Authorize(Roles = "ADMINISTRADOR")]
    public class MunicipeController : Controller
    {
        private readonly RepMunicipe _municipe = new RepMunicipe();
        private readonly RepGenerico RepGenerico=new RepGenerico();
        // GET: Municipe
        public ActionResult Listar()
        {
            var municipes = _municipe.SelecionarTodos();
            return View(municipes);
        }

        // GET: Municipe/Details/5
        public ActionResult Detalhes(string id)
        {
            return View( _municipe.BuscarPorId(id));
        }
       
        [HttpGet]
        // GET: Municipe/Create
        public ActionResult Cadastrar()
        { 
            //Carregar Municipios
            ViewBag.listamunicipio = new SelectList(RepGenerico.CarregarMunicipiosPorProvincia(14), "Id", "Nome");
            //Carregar Genero
            ViewBag.genero = new SelectList(RepGenerico.CarregarGeneros(), "Id", "Nome");

            //Carregar EstadoCivil
            ViewBag.estadoCivil = new SelectList(RepGenerico.CarregarEstadoCivil(), "Id", "Nome");


            //Tipos de Documentos
            var tipoDocIdent = RepGenerico.SelecionarTodosTiposDocumentoIdentificacao();
            ViewBag.tipoDocIdent = new SelectList(tipoDocIdent, "Id", "Nome");
            return View();
        }

        // POST: Municipe/Create
        [HttpPost]
        public ActionResult Cadastrar(MunicipeMorada municipe)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    MunicipeMorada mun = new MunicipeMorada
                    {
                        Nome = municipe.Nome,
                        MunicipeDataNascimento = municipe.MunicipeDataNascimento,
                        MunicipeNDocIdent = municipe.MunicipeNDocIdent,
                        MunicipeTipoDocIdentificacao = municipe.MunicipeTipoDocIdentificacao,
                        MunicipeDocDataEmissao = municipe.MunicipeDocDataEmissao,
                        MunicipeDocDataValidade = municipe.MunicipeDocDataValidade,
                        MunicipeNif = municipe.MunicipeNif,
                        MunicipeGenero = municipe.MunicipeGenero,
                        MunicipeEstadoCivil = municipe.MunicipeEstadoCivil,
                        MunicipeTelefone1 = municipe.MunicipeTelefone1,
                        MunicipeTelefone2 = municipe.MunicipeTelefone2,
                        MunicipeEmail = municipe.MunicipeEmail,
                        
                       
                        MunicipeFoto = municipe.MunicipeFoto,
                        Idcadastrador = GuardaSessao.Id,

                        MoradaCasaN = municipe.MoradaCasaN,
                        MoradaZona = municipe.MoradaZona,
                        MoradaRuaId = municipe.MoradaRuaId,
                        
                    };
                    _municipe.Cadastrar(mun);

                }
                return RedirectToAction("Listar");
            }
            catch
            {
                return View();
            }
        }

        // GET: Municipe/Edit/5
        public ActionResult Alterar(string id)
        {//Carregar Municipios
            ViewBag.listamunicipio = new SelectList(RepGenerico.CarregarMunicipiosPorProvincia(14), "Id", "Nome");
            //Carregar Genero
            ViewBag.genero = new SelectList(RepGenerico.CarregarGeneros(), "Id", "Nome");

            //Carregar EstadoCivil
            ViewBag.estadoCivil = new SelectList(RepGenerico.CarregarEstadoCivil(), "Id", "Nome");


            //Tipos de Documentos
            var tipoDocIdent = RepGenerico.SelecionarTodosTiposDocumentoIdentificacao();
            ViewBag.tipoDocIdent = new SelectList(tipoDocIdent, "Id", "Nome");


            return View( _municipe.BuscarPorId(id));
        }

        // POST: Municipe/Edit/5
        [HttpPost]
        public ActionResult Alterar(Municipe municipe)
        {
            try
            {
                Municipe mun = new Municipe();
                mun.Id = municipe.Id;
                mun.MunicipeNm = municipe.MunicipeNm;
                mun.Nome =municipe.Nome;
                mun.MunicipeNDocIdent = municipe.MunicipeNDocIdent;
                mun.MunicipeTipoDocIdentificacao = municipe.MunicipeTipoDocIdentificacao;
                mun.MunicipeDocDataEmissao = municipe.MunicipeDocDataEmissao;
                mun.MunicipeDocDataValidade = municipe.MunicipeDocDataValidade;
                mun.MunicipeNif = municipe.MunicipeNif;
                mun.MunicipeGenero = municipe.MunicipeGenero;
                mun.MunicipeEstadoCivil = municipe.MunicipeEstadoCivil;
                mun.MunicipeTelefone1 = municipe.MunicipeTelefone1;
                mun.MunicipeTelefone2 = municipe.MunicipeTelefone2;
                mun.MunicipeEmail = municipe.MunicipeEmail;
                mun.MunicipeFoto = municipe.MunicipeFoto;
                mun.Estado = municipe.Estado;
                _municipe.Alterar(mun);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Municipe/Delete/5
        public ActionResult Excluir(int id)
        {
            return View();
        }

        // POST: Municipe/Delete/5
        [HttpPost]
        public ActionResult Excluir(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        [HttpGet]
        public ActionResult ListarPorNm(int id)
        {
            var moradas = RepGenerico.CarregarMoradasPorNm(1);
            return View(moradas);
        }

        
        public ActionResult GetComunas(int id)
        {
            //Carregar Municipios
            List<Comunas> comunas = RepGenerico.CarregarComunaPorMunicipio(id);
            ViewBag.listaComunas = new SelectList(comunas, "Id", "Nome");
            return PartialView("mostrarComunas");

        }
        public ActionResult GetBairros(int id)
        {
            //Carregar Municipios
            List<Bairros> bairros = RepGenerico.CarregarBairrosPorComuna(id);
            ViewBag.listaBairros = new SelectList(bairros, "Id", "Nome");
            return PartialView("mostrarBairros");

        }
        public ActionResult GetRuas(int id)
        {
            //Carregar Municipios
            List<Rua> ruas = RepGenerico.CarregarRuasPorBairros(id);
            ViewBag.listaRuas = new SelectList(ruas, "Id", "Nome");
            return PartialView("mostrarRuas");

        }

        public ActionResult TesResult(string id)
        {
            return View();
        }

    }
}
