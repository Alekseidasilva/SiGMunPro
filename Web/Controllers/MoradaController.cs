using System;
using System.Web.Mvc;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Locais;

namespace Web.Controllers
{
    public class MoradaController : Controller
    { 
       private readonly RepGenerico RepGenerico=new RepGenerico();
        // GET: Morada
        [HttpGet]
        public ActionResult ListarPorNm()
        {
            var moradas = RepGenerico.CarregarMoradasPorNm(1);
            return View(moradas);
        }
        [HttpGet]
        public ActionResult Cadastrar()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Cadastrar(Moradas moradas)
        {
            return View();
        }
    }
}