using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Locais;

namespace Web.Controllers
{
    public class MoradaController : Controller
    { 
    private readonly RepGenerico RepGenerico=new RepGenerico();
    private readonly RepMorada RepMorada = new RepMorada();
    private readonly RepMunicipe mun = new RepMunicipe();

    #region Principais
        // GET: Morada
        [HttpGet]
        public ActionResult ListarPorNm(string id)
        {
            var moradas =RepMorada.CarregarMoradasPorNm(id);
            ViewBag.municipe =mun.BuscarPorNome(id);
            return View(moradas);
        }
        [HttpGet]
        public ActionResult Cadastrar(string id)
        {
            //Carregar Municipios
            ViewBag.listamunicipio = new SelectList(RepGenerico.CarregarMunicipiosPorProvincia(14), "Id", "Nome");
            //var moradas = RepMorada.CarregarPorNm(id);
            ViewBag.id = id;
            return View();
        }
        [HttpPost]
        public ActionResult Cadastrar(Moradas moradas, string id)
        {
            Moradas m=new Moradas
            {
                MoradaMunicuipeNm = id,
                MoradaCasaN = moradas.MoradaCasaN,
                MoradaZona = moradas.MoradaZona,
                MoradaRuaId = moradas.MoradaRuaId,
                DataCadastro = DateTime.Now,
                Estado = true,
                Idcadastrador = GuardaSessao.Id
            };
            RepMorada.Cadastrar(m);
            return RedirectToAction("ListarPorNm/"+id);
        }
        [HttpGet]
        public ActionResult Alterar(string id)
        {
            //Carregar Municipios
            ViewBag.listamunicipio = new SelectList(RepGenerico.CarregarMunicipiosPorProvincia(14), "Id", "Nome");
            var morada = RepMorada.CarregarMoradaPorNm(id);
            ViewBag.id = id;
            return View(morada);
        }
        [HttpPost]
        public ActionResult Alterar(Moradas moradas)
        {
            Moradas m = new Moradas
            {
                MoradaMunicuipeNm = moradas.MoradaMunicuipeNm,
                MoradaZona = moradas.MoradaZona,
                MoradaRuaId = moradas.MoradaRuaId,
                MoradaCasaN = moradas.MoradaCasaN
            };
            RepMorada.Alterar(m);            
            return RedirectToAction("ListarPorNm");
        }
        #endregion
    #region PartialViews
        [HttpGet]
        public ActionResult PartialCadastrarRua(string id)
        {
            return PartialView("PartialCadastrarRua");
        }
        [HttpPost]
        public ActionResult PartialCadastrarRua(Rua rua)
        {
            return PartialView("PartialCadastrarRua");
        }
         #endregion
    #region DropDownList
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
        #endregion
    }
}