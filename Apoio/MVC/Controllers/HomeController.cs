using System.Web.Mvc;
using MVC.Models.Contratos.Repositorios;

namespace MVC.Controllers
{
     [Authorize]
    public class HomeController : Controller
    {
        private readonly RepUsuario _usuario = new RepUsuario();
        [HttpGet]
        public ActionResult Dashboard()
        {
            ViewBag.TotalUsuariosCadastrados = _usuario.TotalUsuariosCadastrados();
            return View();
        }

        [HttpGet]
        public ActionResult Suporte()
        {
            return View("Index");
        }

        public ActionResult Sobre()
        {
            return View("Index");
        }
    }
}
