using System.Web.Mvc;

namespace Web.Controllers
{
    [Authorize(Roles ="ADMINISTRADOR")]
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Dashboard()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AnotherLink()
        {
            return View("Index");
        }
    }
}
