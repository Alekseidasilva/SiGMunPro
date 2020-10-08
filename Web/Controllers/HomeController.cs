using System.Web.Mvc;

namespace Web.Controllers
{
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
