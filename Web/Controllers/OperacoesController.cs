using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Municipe;
using Web.Models.Entidades.Outras;

namespace Web.Controllers
{
     [Authorize(Roles = PerfilAgrupamento.ADMIN_CD_FUNC)]
    public class OperacoesController : Controller
    {
       private readonly RepFinalidades _finalidades=new RepFinalidades();
        private readonly RepOperacoes _operacoes=new RepOperacoes();
       private readonly RepTiposDeDocumentos _repTiposDeDocumentos=new RepTiposDeDocumentos();

        #region Principais
        // GET: Operacoes
        public ActionResult Listar(string txtPesquisar, string ordenarPor)
        {
            try
            {
                var encontrados = _operacoes.SelecionarTodos();
                if (!string.IsNullOrEmpty(txtPesquisar))
                {
                    encontrados=_operacoes.Pesquisar(txtPesquisar);
                }

                switch (ordenarPor)
                {
                    case "NM":
                        encontrados = _operacoes.OrdenarPeloNM();
                        break;
                    case "tipodoc":
                        encontrados = _operacoes.OrdenarPeloNM();
                        break;
                    case "data":
                        encontrados = _operacoes.OrdenarPeloNM();
                        break;

                }
                return View(encontrados);
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
        }

        public ActionResult ExecutarNova()
        {
            try
            {
                ViewBag.TiposDeDocumentos = new SelectList(_repTiposDeDocumentos.SelecionarTodosActivos(), "Id", "Nome");
                return View();
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
        }
        [HttpGet]
        public JsonResult ListarTodos()
        {
            try
            {
                return Json(_operacoes.SelecionarTodos(),JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                throw;
                GuardaSessao.Erros = Convert.ToString(e);
                //return RedirectToAction("Erro", "Error");
            }
        }
        [HttpGet]
        public ActionResult PesquisarMunicipe(string txtMunicipe)
        {
            RepMunicipe repmunicipe = new RepMunicipe();
            ViewBag.nome="Aleksei da Silva";
            return PartialView("mostrarDadosDoMunicipe",repmunicipe.BuscarPeloNMBarcodeQr(txtMunicipe));
        }
        #endregion

        #region DropDownList
        public ActionResult GetFinalidadesPeloId(int id)
        {
            
            List<Finalidades> finalidades = _finalidades.SelecionarTodosActivosPeloTipoDeDocumento(id);
            ViewBag.Finalidades = new SelectList(finalidades, "Id", "Nome");
            return PartialView("mostrarFinaliadesPeloTipoDocumento");

        }
        
        #endregion
    }
}