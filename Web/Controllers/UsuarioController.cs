﻿ using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Perfis;
using Web.Models.Entidades.Usuario;

namespace Web.Controllers
{
         [Authorize(Roles = PerfilAgrupamento.ADMIN_CD)]
        public class UsuarioController : Controller
        {
            readonly RepUsuario _usuario = new RepUsuario();
            readonly RepPerfil perfil = new RepPerfil();

            // GET: Usuario
            public ActionResult Index(IdentityUser user)
            {
                try
                {
                    var users = _usuario.SelecionarTodosComPerfilId();
                    ViewData["Profile"] = new List<Role>(perfil.SelecionarTodos());
                    return View(users);
                }
                catch (Exception e)
                {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }

        }
            [HttpGet]
            public ActionResult Cadastrar()
            {
                try
                {
                    var perfis = perfil.SelecionarTodosActivos();
                    ViewBag.perfil = new SelectList(perfis, "Id", "Name");
                    return View();
                }
                catch (Exception e)
                {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
            }
            [HttpPost]
            public ActionResult Cadastrar(User Usuario)
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        User user = new User();
                        user.NomeCompleto = Usuario.NomeCompleto;
                        user.UserName = Usuario.UserName;
                        user.Email = Usuario.Email;
                        if (Usuario.PasswordHash == null)
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
                        user.IdCadastrador = GuardaSessao.Id;

                        user.EmailConfirmed = false;
                        user.SecurityStamp = "";
                        user.PhoneNumberConfirmed = false;
                        user.TwoFactorEnabled = false;
                        user.LockoutEnabled = false;
                        user.LockoutEndDateUtc = DateTime.Now;
                        user.AccessFailedCount = 0;
                        string res = _usuario.Cadastrar(user);
                        return RedirectToAction("Index", "Usuario");
                    }
                    ModelState.AddModelError("X", "Erro");
                    return RedirectToAction("Cadastrar");
                }
                catch (Exception e)
                {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
            }


            public ActionResult Alterar(int id)
            {
                try
                {
                    var perfis = perfil.SelecionarTodosActivos();
                    ViewBag.perfil = new SelectList(perfis, "Id", "Name");
                    return View(_usuario.BuscarEntidadePorId(id));
                }
                catch (Exception e)
                {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
            }

            [HttpPost]
            public ActionResult Alterar(User usuario)
            {
                if (ModelState.IsValid)
                {
                    User user = new User();
                    user.Id = usuario.Id;
                    user.NomeCompleto = usuario.NomeCompleto;
                    user.UserName = usuario.UserName;
                    user.Email = usuario.Email;
                    user.PasswordHash = Criptografar("000000");
                    user.PhoneNumber = usuario.PhoneNumber;
                    user.DataCadastro = DateTime.Now;
                    user.Estado = usuario.Estado;
                    user.PerfilId = usuario.PerfilId;

                    user.EmailConfirmed = false;
                    user.SecurityStamp = "";
                    user.PhoneNumberConfirmed = false;
                    user.TwoFactorEnabled = false;
                    user.LockoutEnabled = false;
                    user.LockoutEndDateUtc = DateTime.Now;
                    user.AccessFailedCount = 0;
                    user.IdCadastrador = GuardaSessao.Id;
                    string res = _usuario.Alterar(user);
                    return RedirectToAction("Index", "Usuario");
                }
                ModelState.AddModelError("", "");
                return View();
            }

            public ActionResult Excluir(int id)
            {
                var res = _usuario.Excluir(id);
                if (res != string.Empty)
                {
                    return RedirectToAction("Index");
                }
                return null;
            }

            public ActionResult Detalhes(int id)
            {
                try
                {
                    ViewData["Profile"] = new List<Role>(perfil.SelecionarTodos());
                    return View(_usuario.BuscarListaPeloId(id));
                }
                catch (Exception e)
                {
                    GuardaSessao.Erros = Convert.ToString(e);
                    return RedirectToAction("Erro", "Error");
                }
            }

            #region Metodos Prrivados

            

            
        public ActionResult TrocarSenha(string senhaActual, string NovaSenha)
            {

                return View();
            }


            private bool VerificarSenha(string UserName, string senha)
            {
                var res = "";
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
            #endregion
        
    } 
}