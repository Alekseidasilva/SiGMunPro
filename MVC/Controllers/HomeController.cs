using System.Web.Mvc;

namespace MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Dashboard()
        {
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
