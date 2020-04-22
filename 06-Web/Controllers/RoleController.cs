using System.Linq;
using System.Web.Mvc;
using _06_Web.Models;
using Microsoft.AspNet.Identity.EntityFramework;

namespace _06_Web.Controllers
{
    public class RoleController : Controller
    {
        ApplicationDbContext context;
        // GET: Role
       
        public RoleController()
        {
            context = new ApplicationDbContext();
        }
        public ActionResult Index()
        {
            var Roles = context.Roles.ToList();
           
            return View(Roles);
        }
        public ActionResult Create()
        {
            var Role = new IdentityRole();
            return View(Role);
        }
        [HttpPost]
        public ActionResult Create(IdentityRole Role)
        {
            //context.Roles.Add(Role);
            context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}