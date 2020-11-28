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
           
            ViewBag.Nm = id;
            ViewBag.municipe = mun.BuscarNomePeloId(id);
            //Carregar Municipios
            ViewBag.Marca = new SelectList(RepGenerico.MarcasCarregarTodas(), "Id", "Nome");
            ////Carregar Genero
            //ViewBag.Modelo = new SelectList(RepGenerico.CarregarGeneros(), "Id", "Nome");
           return View();
        }

        // POST: Parente/Create
        [HttpPost]
        public ActionResult Cadastrar(Velocipedes vl, string id)
        {
            try
            {
                var vll = new Velocipedes()
                {
                    VelocipeMunicipeNm =id,
                    VelocipeNLivrete = vl.VelocipeNLivrete,
                    VelocipeNChapa = vl.VelocipeNChapa,
                    VelocipeMarca = vl.VelocipeMarca,
                    VelocipeModelo = vl.VelocipeModelo,
                    VelocipeNQuadro = vl.VelocipeNQuadro,
                    VelocipeComSMotor = vl.VelocipeComSMotor,
                    VelocipeNMotor = vl.VelocipeNMotor,
                    VelocipeDestinoServico = vl.VelocipeDestinoServico,
                    VelocipeCilindragem = vl.VelocipeCilindragem,
                    VelocipeCor = vl.VelocipeCor,
                    Estado = true,
                    DataCadastro = DateTime.Now,
                    Idcadastrador = GuardaSessao.Id
                };
                repVelocipedes.Cadastrar(vll);

                return RedirectToAction("ListarPorNm/" + id);
            }
            catch (Exception e)
            {
                GuardaSessao.Erros = Convert.ToString(e);
                return RedirectToAction("Erro", "Error");

            }
        }


        public ActionResult Alterar(string id)
        {
            return View();
        }
        [HttpPost]
        public ActionResult Alterar(Velocipedes velocipedes, string id)
        {
            return View();
        }

        #endregion

        #region Partial & DropDown

        public ActionResult BuscarModelosPelaMarca(int id)
        {
            //Carregar modelos
            List<Modelos> modelos = RepGenerico.ModelosBuscarPelaMarcaId(id);
            ViewBag.modelos = new SelectList(modelos, "Id", "Nome");
            return PartialView("partialMostrarModelosPorMarca");

        }

        #endregion

    }
}