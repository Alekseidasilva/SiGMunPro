using Microsoft.AspNet.Identity.EntityFramework;
using MVC.helpers;
using MVC.Models.Contratos.Repositorios;
using MVC.Models.Entidades.Perfils;
using MVC.Models.Entidades.Usuario;
using System;
using System.Collections.Generic;
using System.Web.Mvc;


namespace MVC.Controllers
{
    [Authorize]
    public class UsuarioController : Controller
    {
        readonly RepUsuario _usuario=new RepUsuario();
        readonly RepPerfil perfil = new RepPerfil();
       
        // GET: Usuario
        public ActionResult Index(IdentityUser user)
        {
            var users = _usuario.SelecionarTodosComPerfilId();
            ViewData["Profile"]=new List<Role>(perfil.SelecionarTodos());
            return View(users);
        }
        [HttpGet]
        public ActionResult Cadastrar()
        {
            var perfis = perfil.SelecionarTodosActivos();
            ViewBag.perfil = new SelectList(perfis, "Id", "Name");
            return View();
        }
        [HttpPost]
        public ActionResult Cadastrar(User Usuario)
        {
            if (ModelState.IsValid)
            {
                User user =new User();
                user.NomeCompleto = Usuario.NomeCompleto;
                user.UserName = Usuario.UserName;
                user.Email = Usuario.Email;
                if (Usuario.PasswordHash==null)
                {
                    user.PasswordHash = Criptografar("000000");
                }
                else
                {
                    user.PasswordHash = Criptografar(Usuario.PasswordHash);
                }
                
                user.PhoneNumber = Usuario.PhoneNumber;
                user.DataCadastro = DateTime.Now;
                user.Estado = Usuario.Estado;
                user.PerfilId = Usuario.PerfilId;

                user.EmailConfirmed = false;
                user.SecurityStamp = "";
                user.PhoneNumberConfirmed = false;
                user.TwoFactorEnabled = false;
                user.LockoutEnabled = false;
                user.LockoutEndDateUtc = DateTime.Now;
                user.AccessFailedCount = 0;
                string res = _usuario.Cadastrar(user);
                 return RedirectToAction("Index","Usuario");
                    
                }
            ModelState.AddModelError("X","Erro");
            return RedirectToAction("Cadastrar");
        }

        
        public ActionResult Alterar(int id)
        {
            var perfis = perfil.SelecionarTodos();
            ViewBag.perfil = new SelectList(perfis, "Id", "Name");
            return View(_usuario.BuscarPorId(id));
        }

        [HttpPost]
        public ActionResult Alterar(User Usuario)
        {
            if (ModelState.IsValid)
            {
                User user = new User();
                user.Id = Usuario.Id;
                user.NomeCompleto = Usuario.NomeCompleto;
                user.UserName = Usuario.UserName;
                user.Email = Usuario.Email;
                user.PasswordHash = Criptografar("000000");
                user.PhoneNumber = Usuario.PhoneNumber;
                user.DataCadastro = DateTime.Now;
                user.Estado = Usuario.Estado;
                user.PerfilId = Usuario.PerfilId;

                user.EmailConfirmed = false;
                user.SecurityStamp = "";
                user.PhoneNumberConfirmed = false;
                user.TwoFactorEnabled = false;
                user.LockoutEnabled = false;
                user.LockoutEndDateUtc = DateTime.Now;
                user.AccessFailedCount = 0;
                string res = _usuario.Alterar(user);
                return RedirectToAction("Index", "Usuario");
            }
            ModelState.AddModelError("","");
            return View();
        }

        public ActionResult Excluir(int id)
        {
            var res= _usuario.Excluir(id);
            if (res!=string.Empty)
            {
                return RedirectToAction("Index");
            }
            return null;
        }

        public ActionResult Detalhes(int id)
        {
            var user = _usuario.BuscarPorId(id);
            ViewData["Profile"]=new List<Role>(perfil.SelecionarTodos());
            if (user is null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        public ActionResult TrocarSenha(string senhaActual, string NovaSenha)
        {
            
            return View();
        }


        private bool VerificarSenha(string UserName, string senha)
        {
           var res= _usuario.Login(UserName, senha);
           if (res != null)
           {
               return true;
           }

           return false;
        }

        private string Criptografar(string textoAcriptografar)
        {
            Criptografia criptografia = new Criptografia();
            criptografia.Key = "SiGMun";
            string textoCriptografado = criptografia.Encrypt(textoAcriptografar);
            return textoCriptografado;
        }
    }
}