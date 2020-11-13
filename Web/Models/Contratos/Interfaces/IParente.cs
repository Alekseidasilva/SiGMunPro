using System.Collections.Generic;
using Web.Models.Entidades.Municipe;

namespace Web.Models.Contratos.Interfaces
{
   public interface IParente:IBase<Parente>
    {
        List<Parente> ListarPeloNm(string Nm);
    }
}
