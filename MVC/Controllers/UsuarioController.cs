using System.Web.Mvc;
using MVC.Models.Contratos.Repositorios;


namespace MVC.Controllers
{
    public class UsuarioController : Controller
    {
        RepUsuario Usuario=new RepUsuario();
       
        // GET: Usuario
        public ActionResult Index()
        {
            
            return View(Usuario.SelecionarTodos());
            
        }
    }
}