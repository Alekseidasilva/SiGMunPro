using System.Collections.Generic;
using Web.Models.Entidades;

namespace Web.Models.Contratos.Interfaces
{
    interface IVelocipedes:IBase<Velocipedes>
    {
       Velocipedes BuscarEntidadePorIdENm(string id, string nm);
        List<Velocipedes> CarregarPeloNm(string nM);
        int TotalCadastrados();
    }
}
