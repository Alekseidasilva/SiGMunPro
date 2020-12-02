using System;
using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;

namespace Web.Controllers
{
     [Authorize(Roles = PerfilAgrupamento.ADMIN_CD_FUNC)]
    public class OperacoesController : Controller
    {
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
            ViewBag.TiposDeDocumentos = _repTiposDeDocumentos.SelecionarTodos();
            return View();
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
        #endregion

        #region MyRegion



        #endregion
    }
}