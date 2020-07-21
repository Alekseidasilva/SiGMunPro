using System.Web.Mvc;
using System.Web.Security;
using MVC.Models.Contratos.Repositorios;
using MVC.Models.Entidades.Usuario;

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
        public ActionResult Login(UserLogin userLogin)
        {

            while (ModelState.IsValid)
            {
                if (VerificarUsuario(userLogin.Email,userLogin.Senha))
                {
                    FormsAuthentication.SetAuthCookie(userLogin.Email, false);
                    if (userLogin.ReturnUrl != null)
                    {
                        return Redirect(userLogin.ReturnUrl);
                    }
                    return RedirectToAction("Dashboard", "Home");
                }
                else
                {
                    ModelState.AddModelError("Erro","Dados Inválivos");
                    return View();
                }
            }
            return View();
        }
         [Authorize]

        public ActionResult TerminarSessao()
        {
            FormsAuthentication.SignOut();
            return Redirect("/Conta/login");
        }

        private bool VerificarUsuario(string login, string senha)
        {
            RepUsuario repUsuario=new RepUsuario();
          
             User user=repUsuario.Login(login, senha);
             if (login == user.Email && senha == user.PasswordHash)
                 return true;
             else
                 return false;


        }

        private string Criptografar(string senhaAcriptografar)
        {
            return "";
        }
    }
}
