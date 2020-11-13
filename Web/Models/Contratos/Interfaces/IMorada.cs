using System.Collections.Generic;
using Web.Models.Entidades.Locais;

namespace Web.Models.Contratos.Interfaces
{
    interface IMorada:IBase<Moradas>
    {
        string[] CarregarLocais(int id);
        List<Moradas> CarregarMoradasPorNm(string nM);
        Moradas CarregarMoradaPorNm(string nM);
    }
}
