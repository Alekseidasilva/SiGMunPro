using System.Collections.Generic;
using System.Web.Mvc;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Locais;

namespace Web.Controllers
{
    public class MunicipioComunaBairroController : Controller
    { private readonly RepGenerico RepGenerico=new RepGenerico();
        // GET: MunicipioComunaBairro
        public ActionResult Index()
        {ViewBag.listamunicipio=new SelectList(RepGenerico
                .CarregarMunicipiosPorProvincia(14)
            ,"Id","Nome");
            return View();
        }

        public ActionResult GetComunas(int id)
        {
            //Carregar Municipios
            List<Comunas> comunas = RepGenerico.CarregarComunaPorMunicipio(id);
            ViewBag.listaComunas= new SelectList(comunas,"Id","Nome");
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