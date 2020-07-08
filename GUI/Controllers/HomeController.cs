using System.Web.Mvc;

namespace GUI.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        [Authorize]
        public ActionResult Index()
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
