using System.Web.Mvc;
using System.Web.Security;
using MVC.helpers;
using MVC.Models.Contratos.Repositorios;
using MVC.Models.Entidades.Usuario;

namespace MVC.Controllers
{[Authorize]
  
    public class ContaController : Controller
    {
        // GET: Conta
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
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
                    //ModelState.AddModelError("Erro","Dados Inválivos");
                    return View(userLogin);
                }
            }
            return View(userLogin);
        }
        [Authorize]
         public ActionResult TerminarSessao()
        {
            FormsAuthentication.SignOut();
            return Redirect("/Conta/login");
        }
         private bool VerificarUsuario(string login, string senha)
        {
           string senhaCriptografada=Criptografar(senha);
           RepUsuario repUsuario=new RepUsuario();
          
             User user=repUsuario.Login(login, senhaCriptografada);
             if (login == user.UserName && senhaCriptografada == user.PasswordHash)
             {
                repUsuario.SessaoUsuario(login,senhaCriptografada);
                return true;
             }
                 
             else
                 return false;


        }
         private string Criptografar(string textoAcriptografar)
        {
            Criptografia criptografia=new Criptografia();
            criptografia.Key = "SiGMun";
            string textoCriptografado = criptografia.Encrypt(textoAcriptografar);
            return textoCriptografado;
        }
    }
}
