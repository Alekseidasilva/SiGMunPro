using System.Collections.Generic;
using Web.Models.Entidades;

namespace Web.Models.Contratos.Interfaces
{
     public interface IOperacoes:IBase<Operacoes>
     {
         string Executar(Operacoes operacoes);
         List<Operacoes> Pesquisar(string txtPesquisar);
         List<Operacoes> OrdenarPeloNM();
         List<Operacoes> OrdenarPelTipoDocumento();
         List<Operacoes> OrdenarPelaData();
     }
}
