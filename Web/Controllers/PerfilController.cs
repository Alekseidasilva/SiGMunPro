﻿using System;
using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Perfis;

namespace Web.Controllers
{
     [Authorize(Roles = PerfilAgrupamento.ADMIN_CD)]
    public class PerfilController : Controller
    {
        private readonly RepPerfil _perfil = new RepPerfil();
        // GET: Perfil
        public ActionResult Index()
        {
            var perfis = _perfil.SelecionarTodos();

            return View(perfis);
        }

        public ActionResult Cadastrar()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Cadastrar(Role role)
        {
            if (ModelState.IsValid)
            {
                Role roles = new Role
                {
                    Name = role.Name,
                    DataCadastro = DateTime.Now.Date,
                    Estado = role.Estado,
                    IdCadastrador = GuardaSessao.Id

                };
                string res = _perfil.Cadastrar(roles);
                return RedirectToAction("Index");
            }

            return View();
        }
        public ActionResult Alterar(int id)
        {
            var encontrado = _perfil.BuscarPorId(id);
            return View(encontrado);
        }
        [HttpPost]
        public ActionResult Alterar(Role role)
        {
            if (ModelState.IsValid)
            {
                if (role.Id != 0)
                {
                    Role rolesRole = new Role
                    {
                        Id = role.Id,
                        Name = role.Name,
                        Estado = role.Estado
                    };
                    string res = _perfil.Alterar(rolesRole);
                    return RedirectToAction("Index");
                }
            }
            return View();
        }
        public ActionResult Excluir(int id)
        {
            if (id != 0)
            {
                string res = _perfil.Excluir(id);
                return RedirectToAction("Index");
            }
            return View();
        }

    }
}