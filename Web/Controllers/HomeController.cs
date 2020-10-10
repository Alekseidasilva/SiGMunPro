using System.Web.Mvc;
using Web.Models.Contratos.Repositorios;

namespace Web.Controllers
{
    [Authorize(Roles ="ADMINISTRADOR")]
    public class HomeController : Controller
    {
        private readonly RepUsuario _usuario = new RepUsuario();
        [HttpGet]
        public ActionResult Dashboard()
        { string nUser="";
            if (_usuario.TotalUsuariosCadastrados()<10)
            {
                nUser = "0" + _usuario.TotalUsuariosCadastrados();
                ViewBag.TotalUsuariosCadastrados = nUser;
                return View();
            }
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
