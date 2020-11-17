using System.Collections.Generic;
using Web.Models.Entidades.Municipe;

namespace Web.Models.Contratos.Interfaces
{
   public interface IParente:IBase<Parente>
    {
        string CadstrarNovo(ParenteMorada parenteMorada);
        string CadstrarJaCadastrado(Parente parente);
        List<Parente> ListarPeloNm(string Nm);
    }
}
