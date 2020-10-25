using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Web.Mvc;
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
        public ActionResult Detalhes(int id)
        {
            return View();
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
        public ActionResult Cadastrar(Municipe municipe)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Municipe/Edit/5
        public ActionResult Alterar(int id)
        {
            return View();
        }

        // POST: Municipe/Edit/5
        [HttpPost]
        public ActionResult Alterar(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

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

    }
}
