using System.Web.Mvc;
using Web.Models.Contratos.Repositorios;

namespace Web.Controllers
{
    public class ParenteController : Controller
    {
        private readonly RepGenerico RepGenerico = new RepGenerico();
        private readonly RepParente repParente = new RepParente();
        private readonly RepMunicipe mun = new RepMunicipe();
        // GET: Parente
        public ActionResult ListarPorNm(string id)
        {
            var parentes = repParente.ListarPeloNm(id);
            //ViewBag.municipe = mun.BuscarPorNome(id);
            return View(parentes);
         
        }
        // GET: Parente/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Parente/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
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

        // GET: Parente/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Parente/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
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

        // GET: Parente/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Parente/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
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
    }
}
