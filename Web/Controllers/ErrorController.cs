using System.Web.Mvc;
using Web.Helpers;

namespace Web.Controllers
{
    public class ErrorController : Controller
    {
        [HttpGet]
        public ActionResult InternalServerError()
        {
            return View();
        }

        [HttpGet]
        public ActionResult NotFound()
        {
            return View();
        }

        public ActionResult Erro()
        {
            ViewBag.erro = GuardaSessao.Erros;
            return View();
        }
    }
}
