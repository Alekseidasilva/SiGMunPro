using Dominio.Entidades;
using Dominio.Entidades.Usuario;
using System.Web.Mvc;
using System.Web.Security;

namespace MVC.Controllers
{
    public class ContaController : Controller
    {
        // GET: Conta

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserLogin login, string ReturnUrl)
        {

            while (ModelState.IsValid)
            {
                if (ValidarUsuario(login))
                {
                    FormsAuthentication.SetAuthCookie(login.Email, false);
                    if (ReturnUrl != null)
                    {
                        return Redirect(ReturnUrl);
                    }
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return View();
                }
            }
            return View();
        }

        public ActionResult TerminarSessao()
        {
            FormsAuthentication.SignOut();
            return Redirect("/Conta/login");
        }

        private bool ValidarUsuario(UserLogin user)
        {
            //
            return (user.Email == "teste" && user.Senha == "teste");
        }
    }
}
