using Web.Models.Entidades.Outras;

namespace Web.Models.Contratos.Interfaces
{
    interface ITiposDeDocumentos:IBase<TiposDeDocumentos>
    {
        string BuscarNomePeloId(int id);
    }
}
