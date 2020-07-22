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
       
        // GET: Usuario
        public ActionResult Index(IdentityUser user)
        {
            //RepPerfil perfil=new RepPerfil();
            //ViewBag.Perfil = perfil.CarregarPorUsuario(int.Parse(user.Id));
            return View(Usuario.SelecionarTodos());
            
        }

        public ActionResult Cadastrar(User user)
        {
            

            return View();
        }
    }
}