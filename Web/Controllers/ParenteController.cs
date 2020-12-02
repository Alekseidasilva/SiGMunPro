using System.Web.Mvc;
using Web.Helpers;
using Web.Models.Contratos.Repositorios;
using Web.Models.Entidades.Municipe;

namespace Web.Controllers
{
     [Authorize(Roles = PerfilAgrupamento.ADMIN_CD_FUNC)]
    public class ParenteController : Controller
    {
        private readonly RepGenerico RepGenerico = new RepGenerico();
        private readonly RepParente repParente = new RepParente();
        private readonly RepMunicipe mun = new RepMunicipe();
        // GET: Parente
        public ActionResult ListarPorNm(string id)
        {
            var parentes = repParente.ListarPeloNm(id);
            ViewBag.idMunicipe = id;
            ViewBag.municipe = mun.BuscarNomePeloId(id);
            return View(parentes);
         
        }
        // GET: Parente/Create
        public ActionResult Cadastrar(string nM)
        {
            var parentes = repParente.ListarPeloNm(nM);
            ViewBag.Nm = nM;
            ViewBag.municipe = mun.BuscarNomePeloId(nM);
            //Carregar Municipios
            ViewBag.listamunicipio = new SelectList(RepGenerico.CarregarMunicipiosPorProvincia(14), "Id", "Nome");
            //Carregar Genero
            ViewBag.genero = new SelectList(RepGenerico.CarregarGeneros(), "Id", "Nome");
            //Carregar EstadoCivil
            ViewBag.estadoCivil = new SelectList(RepGenerico.CarregarEstadoCivil(), "Id", "Nome");
            //Tipos de Documentos            
            ViewBag.tipoDocIdent = new SelectList(RepGenerico.SelecionarTodosTiposDocumentoIdentificacao(), "Id", "Nome");
            //Garu Parentesco           
            ViewBag.grauParentesco = new SelectList(RepGenerico.CarregarGrauParentesco(), "Id", "Nome");
            return View();
        }

        // POST: Parente/Create
        [HttpPost]
        public ActionResult Cadastrar(ParenteMorada pM, string nM)
        {
            try
            {

                var pMM = new ParenteMorada 
                {
                    Id=pM.Id,
                    MunicipeNm=nM,
                    Nome = pM.Nome,
                    MunicipeDataNascimento = pM.MunicipeDataNascimento,
                    MunicipeNDocIdent = pM.MunicipeNDocIdent,
                    MunicipeTipoDocIdentificacao = pM.MunicipeTipoDocIdentificacao,
                    MunicipeDocDataEmissao = pM.MunicipeDocDataEmissao,
                    MunicipeDocDataValidade = pM.MunicipeDocDataValidade,
                    MunicipeNif = pM.MunicipeNif,
                    MunicipeGenero = pM.MunicipeGenero,
                    MunicipeEstadoCivil = pM.MunicipeEstadoCivil,
                    MunicipeTelefone1 = pM.MunicipeTelefone1,
                    MunicipeTelefone2 = pM.MunicipeTelefone2,
                    MunicipeEmail = pM.MunicipeEmail,


                    MunicipeFoto = "MunicipeFoto",
                    Idcadastrador = GuardaSessao.Id,

                    MoradaCasaN = pM.MoradaCasaN,
                    MoradaZona = pM.MoradaZona,
                    MoradaRuaId = pM.MoradaRuaId,

                    MunicipeGrauParentescoId=pM.MunicipeGrauParentescoId,
                    MunicipeParenteNm=pM.MunicipeParenteNm
                };
                repParente.CadstrarNovo(pMM);

                return RedirectToAction("ListarPorNm/"+nM);
            }
            catch
            {
                return View();
            }
        }

        // GET: Parente/Create
        public ActionResult JaCadastrado(string nM)
        {
            return View();
        }

        // POST: Parente/Create
        [HttpPost]
        public ActionResult JaCadastrado(FormCollection collection)
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
        public ActionResult Alterar(string id, string nM)
        {            
            //Carregar Genero
            ViewBag.genero = new SelectList(RepGenerico.CarregarGeneros(), "Id", "Nome");
            //Carregar EstadoCivil
            ViewBag.estadoCivil = new SelectList(RepGenerico.CarregarEstadoCivil(), "Id", "Nome");
            //Tipos de Documentos
            var tipoDocIdent = RepGenerico.SelecionarTodosTiposDocumentoIdentificacao();
            ViewBag.tipoDocIdent = new SelectList(tipoDocIdent, "Id", "Nome");
            //Garu Parentesco           
            ViewBag.grauParentesco = new SelectList(RepGenerico.CarregarGrauParentesco(), "Id", "Nome");
            ViewBag.idMunicipe = id;
            ViewBag.municipe = mun.BuscarNomePeloId(id);
            return View(repParente.BuscarEntidadePelonM(nM));
        }

        // POST: Parente/Edit/5
        [HttpPost]
        public ActionResult Alterar(Parente parente,string id)
        {
            Parente p = new Parente();

            p.Id = parente.Id;
            p.MunicipeNm = parente.MunicipeNm;
            p.Nome = parente.Nome;
            p.MunicipeNDocIdent = parente.MunicipeNDocIdent;
            p.MunicipeTipoDocIdentificacao = parente.MunicipeTipoDocIdentificacao;
            p.MunicipeDataNascimento = parente.MunicipeDataNascimento;
            p.MunicipeDocDataEmissao = parente.MunicipeDocDataEmissao;
            p.MunicipeDocDataValidade = parente.MunicipeDocDataValidade;
            p.MunicipeNif = parente.MunicipeNif;
            p.MunicipeGenero = parente.MunicipeGenero;
            p.MunicipeEstadoCivil = parente.MunicipeEstadoCivil;
            p.MunicipeTelefone1 = parente.MunicipeTelefone1;
            p.MunicipeTelefone2 = parente.MunicipeTelefone2;
            p.MunicipeEmail = parente.MunicipeEmail;
            p.MunicipeFoto = "parente.MunicipeFoto";
            p.Estado = true;
            p.MunicipeGrauParentescoId = parente.MunicipeGrauParentescoId;
            repParente.Alterar(p);
            return RedirectToAction("ListarPorNm/" + id);
                           
        }

        // GET: Parente/Delete/5
        public ActionResult Excluir(int id)
        {
            return View();
        }

        // POST: Parente/Delete/5
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
    }
}
