﻿using System;
using System.Web.Mvc;
using Web.Models.Contratos.Repositorios;

namespace Web.Controllers
{
    [Authorize(Roles = "ADMINISTRADOR")]
    public class MunicipeController : Controller
    {
        private readonly RepMunicipe _municipe = new RepMunicipe();

         private readonly RepGenerico RepGenerico=new RepGenerico();
        // GET: Municipe
        public ActionResult Listar()
        {
            var municipes = _municipe.SelecionarTodos();
            return View(municipes);
        }

        // GET: Municipe/Details/5
        public ActionResult Detalhes(int id)
        {
            return View();
        }
       
        [HttpGet]
        // GET: Municipe/Create
        public ActionResult Cadastrar()
        {
            return View();
        }

        // POST: Municipe/Create
        [HttpPost]
        public ActionResult Cadastrar(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Municipe/Edit/5
        public ActionResult Alterar(int id)
        {
            return View();
        }

        // POST: Municipe/Edit/5
        [HttpPost]
        public ActionResult Alterar(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Municipe/Delete/5
        public ActionResult Excluir(int id)
        {
            return View();
        }

        // POST: Municipe/Delete/5
        [HttpPost]
        public ActionResult Excluir(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        [HttpGet]
        public ActionResult ListarPorNm(int id)
        {
            var moradas = RepGenerico.CarregarMoradasPorNm(1);
            return View(moradas);
        }

    }
}
