using System.Web.Mvc;
using Web.Models.Contratos.Repositorios;

namespace Web.Controllers
{
    [Authorize(Roles ="ADMINISTRADOR")]
    public class HomeController : Controller
    {
        private readonly RepUsuario _usuario = new RepUsuario();
         private readonly RepMunicipe _municipe = new RepMunicipe();
        [HttpGet]
        public ActionResult Dashboard()
        { string nUser="", nMunicipe="";

            ViewBag.TotalMunicipesCadastrados = _municipe.TotalMunicipesCadastrados();
            ViewBag.TotalUsuariosCadastrados = _usuario.TotalUsuariosCadastrados();
            if (_usuario.TotalUsuariosCadastrados()<10)
            {
                nUser = "0" + _usuario.TotalUsuariosCadastrados();
                ViewBag.TotalUsuariosCadastrados = nUser;
               
            }
            if (_municipe.TotalMunicipesCadastrados() < 10)
            {
                nMunicipe = "0" + _municipe.TotalMunicipesCadastrados();
                ViewBag.TotalMunicipesCadastrados = nMunicipe;
                
            }
            
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
