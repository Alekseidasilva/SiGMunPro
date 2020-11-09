using System.Web.Mvc;
using System.Web.Security;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Usuario;

namespace Web.Controllers
{    [Authorize]
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
            var mensagens = "nada";
            if (ModelState.IsValid)
            {
                if (VerificarUsuario(userLogin.Email))
                {
                    for (int i = BuscarTentativas(userLogin.Email); i <= 2;)
                    {
                        if (VerificarSenha(userLogin.Email, userLogin.Senha))
                        {

                            if (BuscarEstado(userLogin.Email))
                            {
                                FormsAuthentication.SetAuthCookie(userLogin.Email, userLogin.PermanecerLogado);
                                if (userLogin.ReturnUrl != null && Url.IsLocalUrl(userLogin.ReturnUrl))
                                {
                                    //return Redirect(userLogin.ReturnUrl);
                                    return RedirectToAction("Dashboard", "Home");
                                }
                                Tentativas(userLogin.Email, 0);
                                return RedirectToAction("Dashboard", "Home");
                            }
                            mensagens = "Conta desativada,  contacte o Administrador do Sistema";
                            return View(userLogin);
                        }
                        i++;
                        Tentativas(userLogin.Email, i);
                        mensagens = "Senha Incorrecta";
                        ViewBag.mensagem = mensagens;
                        return View(userLogin);

                    }
                    mensagens = "Conta desativada,  contacte o Administrador do Sistema";
                }
                else
                {
                    mensagens = "Usuario nao encontrado";
                }

            }

            ViewBag.mensagem = mensagens;
            return View(userLogin);
        }
        public ActionResult TerminarSessao()
        {
            FormsAuthentication.SignOut();
            return Redirect("/Conta/login");
        }
        private void Tentativas(string usuario, int ntentativas)
        {
            RepUsuario repUsuario = new RepUsuario();
            repUsuario.Tentativas(usuario, ntentativas);
        }
        private int BuscarTentativas(string usuario)
        {
            RepUsuario repUsuario = new RepUsuario();
            return repUsuario.BuscarTentativas(usuario);
        }
        private bool VerificarUsuario(string login)
        {
            RepUsuario repUsuario = new RepUsuario();
            if (repUsuario.VerificarUsuario(login))
                return true;
            else
                return false;
        }
        private bool VerificarSenha(string login, string senha)
        {
            RepUsuario repUsuario = new RepUsuario();
            string senhaCriptografada = Criptografar(senha);

            if (repUsuario.VerificarSenha(login, senhaCriptografada))
            {
                repUsuario.SessaoUsuario(login, senhaCriptografada);
                return true;
            }
            else
                return false;

        }
        private string Criptografar(string textoAcriptografar)
        {
            Criptografia criptografia = new Criptografia();
            criptografia.Key = "SiGMun";
            string textoCriptografado = criptografia.Encrypt(textoAcriptografar);
            return textoCriptografado;
        }

        private bool BuscarEstado(string Username)
        {
            RepUsuario repUsuario = new RepUsuario();
            return repUsuario.BuscarEstado(Username);
        }
    }
}