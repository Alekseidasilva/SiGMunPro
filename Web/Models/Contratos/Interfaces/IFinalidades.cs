using System.Collections.Generic;
using Web.Models.Entidades.Outras;

namespace Web.Models.Contratos.Interfaces
{
    public interface IFinalidades:IBase<Finalidades>
    {
        string BuscarNomePeloId(int id);
        List<Finalidades> SelecionarTodosActivosPeloTipoDeDocumento(int id);

    }
}
