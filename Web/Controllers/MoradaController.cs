using System.Web.Mvc;
using Web.Models.Entidades.Outras;

namespace Web.Controllers
{
    public class MoradaController : Controller
    {
        // GET: Morada
        public ActionResult Index()
        {
            return View();
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