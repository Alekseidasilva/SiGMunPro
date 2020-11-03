using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Locais;

namespace Web.Controllers
{
    public class MoradaController : Controller
    { 
       private readonly RepGenerico RepGenerico=new RepGenerico();
       private readonly RepMorada RepMorada = new RepMorada();
        // GET: Morada
        [HttpGet]
        public ActionResult ListarPorNm(string id)
        {
            var moradas =RepMorada.CarregarPorNm(id);
            return View(moradas);
        }
        [HttpGet]
        public ActionResult Cadastrar()
        {
            //Carregar Municipios
            ViewBag.listamunicipio = new SelectList(RepGenerico.CarregarMunicipiosPorProvincia(14), "Id", "Nome");
            return View();
        }
        [HttpPost]
        public ActionResult Cadastrar(Moradas moradas)
        {

            return View();
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

    }
}