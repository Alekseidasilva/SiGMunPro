using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades;
using Web.Models.Entidades.Outras;

namespace Web.Controllers
{
     [Authorize(Roles = PerfilAgrupamento.ADMIN_CD_FUNC)]
    public class VelocipedesController : Controller
    {
        private readonly RepGenerico RepGenerico = new RepGenerico();
        private readonly RepVelocipedes repVelocipedes = new RepVelocipedes();
        private readonly RepMunicipe mun = new RepMunicipe();

        #region Principal
          // GET: Velocipedes
        public ActionResult ListarPorNm(string id)
        {
            ViewBag.nM = id;
            ViewBag.municipe = mun.BuscarNomePeloId(id);
            return View(repVelocipedes.CarregarPeloNm(id));
        }
        // GET: Parente/Create
        public ActionResult Cadastrar(string id)
        {
            try
            {

                ViewBag.Nm = id;
                ViewBag.municipe = mun.BuscarNomePeloId(id);
                ViewBag.Marca = new SelectList(RepGenerico.MarcasCarregarTodas(), "Id", "Nome");
                return View();
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
        }

        // POST: Parente/Create
        [HttpPost]
        public ActionResult Cadastrar(Velocipedes vl, string id)
        {
            try
            {
                var vll = new Velocipedes();

                vll.VelocipeMunicipeNm = id;
                vll.VelocipeNLivrete = vl.VelocipeNLivrete;
                vll.VelocipeNChapa = vl.VelocipeNChapa;
                vll.VelocipeMarca = vl.VelocipeMarca;
                vll.VelocipeModelo = vl.VelocipeModelo;
                vll.VelocipeNQuadro = vl.VelocipeNQuadro;
                vll.VelocipeComSMotor = vl.VelocipeComSMotor;
                if (vll.VelocipeComSMotor)
                    vll.VelocipeNMotor = vl.VelocipeNMotor;
                else
                {
                    vll.VelocipeNMotor = "SEM MOTOR"; 
                }
                vll.VelocipeDestinoServico = vl.VelocipeDestinoServico;
                vll.VelocipeCilindragem = vl.VelocipeCilindragem;
                vll.VelocipeCor = vl.VelocipeCor;
                vll.Estado = true;
                vll.DataCadastro = DateTime.Now;
                vll.Idcadastrador = GuardaSessao.Id;
                repVelocipedes.Cadastrar(vll);
                return RedirectToAction("ListarPorNm/" + id);
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");

            }
        }


        public ActionResult Alterar(string id, string nm )
        {
            try
            {
                ViewBag.Nm = nm;
                ViewBag.municipe = mun.BuscarNomePeloId(nm);
                ViewBag.Marca = new SelectList(RepGenerico.MarcasCarregarTodas(), "Id", "Nome");
                return View(repVelocipedes.BuscarEntidadePorIdENm(id, nm));
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
            
        }
        [HttpPost]
        public ActionResult Alterar(Velocipedes v)
        {
            try
            {
                Velocipedes x = new Velocipedes();
                x.Id = v.Id;
                x.VelocipeMunicipeNm = v.VelocipeMunicipeNm;
                x.VelocipeNLivrete = v.VelocipeNLivrete;
                x.VelocipeNChapa = v.VelocipeNChapa;
                x.VelocipeMarca = v.VelocipeMarca;
                x.VelocipeModelo = v.VelocipeModelo;
                x.VelocipeNQuadro = v.VelocipeNQuadro;
                x.VelocipeComSMotor = v.VelocipeComSMotor;
                if (x.VelocipeComSMotor)
                    x.VelocipeNMotor = v.VelocipeNMotor;
                else
                {
                    x.VelocipeNMotor = "SEM MOTOR";
                }

                x.VelocipeDestinoServico = v.VelocipeDestinoServico;
                x.VelocipeCilindragem = v.VelocipeCilindragem;
                x.VelocipeCor = v.VelocipeCor;
                x.Estado = v.Estado;
               string res= repVelocipedes.Alterar(x);
               return RedirectToAction("ListarPorNm/"+v.VelocipeMunicipeNm);
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }
        }

        #endregion

        #region Partial & DropDown

        public ActionResult BuscarModelosPelaMarca(int id)
        {
            try
            {
                //Carregar modelos
                List<Modelos> modelos = RepGenerico.ModelosBuscarPelaMarcaId(id);
                ViewBag.modelos = new SelectList(modelos, "Id", "Nome");
                return PartialView("partialMostrarModelosPorMarca");
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");
            }

        }

        #endregion

    }
}