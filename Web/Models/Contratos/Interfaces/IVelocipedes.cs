using System.Collections.Generic;
using Web.Models.Entidades;

namespace Web.Models.Contratos.Interfaces
{
    interface IVelocipedes:IBase<Velocipedes>
    {
        List<Velocipedes> CarregarPeloNm(string nM);
        int TotalCadastrados();
    }
}
