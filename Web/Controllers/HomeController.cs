using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;

namespace Web.Controllers
{
    [Authorize(Roles = PerfilAgrupamento.ADMIN_CD_FUNC)]
    public class HomeController : Controller
    {
        private readonly RepUsuario _usuario = new RepUsuario();
         private readonly RepMunicipe _municipe = new RepMunicipe();
         private readonly RepVelocipedes _velocipedes = new RepVelocipedes();
         private readonly RepGenerico _generico = new RepGenerico();
        [HttpGet]
        public ActionResult Dashboard()
        { string nUser="", nMunicipe="", nVelocipedes="", nOperacoes="";


            ViewBag.TotalMunicipesCadastrados = _municipe.TotalMunicipesCadastrados();
            ViewBag.TotalUsuariosCadastrados = _usuario.TotalUsuariosCadastrados();
            ViewBag.TotalVelocipedesCadastrados = _velocipedes.TotalCadastrados();
            ViewBag.TotalOperacoesRealizadas = _generico.TotalOperacoes();
            if (_usuario.TotalUsuariosCadastrados()<10)
            {
                nUser = "0" + _usuario.TotalUsuariosCadastrados();
                ViewBag.TotalUsuariosCadastrados = nUser;
               
            }
            if (_municipe.TotalMunicipesCadastrados() < 10)
            {
                nMunicipe = "0" + _municipe.TotalMunicipesCadastrados();
                ViewBag.TotalMunicipesCadastrados = nMunicipe;
                
            }
            if (_velocipedes.TotalCadastrados() < 10)
            {
                nVelocipedes = "0" + _velocipedes.TotalCadastrados();
                ViewBag.TotalCadastrados = nVelocipedes;

            }
            if (_generico.TotalOperacoes() < 10)
            {
                nOperacoes = "0" +_generico.TotalOperacoes();
                ViewBag.TotalOperacoesRealizadas = nOperacoes;

            }

            return View();
        }

        [HttpGet]
        public ActionResult Suporte()
        {
            return View("Index");
        }
        public ActionResult Sobre()
        {
            return View("Index");
        }
    }
}
