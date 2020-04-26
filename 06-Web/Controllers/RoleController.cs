using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using _06_Web.Models;
using Microsoft.AspNet.Identity;
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
        public ActionResult Create(RoleProvider role)
        {
            //context.Roles.Add(role);
            context.SaveChanges();
            return RedirectToAction("Index");
            //Nada feito aqui
        }
    }
}