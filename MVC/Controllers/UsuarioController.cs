using System.Web.Mvc;
using Microsoft.AspNet.Identity.EntityFramework;
using MVC.Models.Contratos.Repositorios;
using MVC.Models.Entidades.Usuario;


namespace MVC.Controllers
{
     //[Authorize]
    public class UsuarioController : Controller
    {
        RepUsuario Usuario=new RepUsuario();
        RepPerfil perfil = new RepPerfil();
       
        // GET: Usuario
        public ActionResult Index(IdentityUser user)
        {
            
            return View(Usuario.SelecionarTodos());
            
        }
        [HttpGet]
        public ActionResult Cadastrar()
        {
            
            var perfis = perfil.SelecionarTodos();
            ViewBag.perfil = new SelectList(perfis, "Id", "Name");
            return View();
        }
        [HttpPost]
        public ActionResult Cadastrar(User user)
        {


            return View();
        }
    }
}