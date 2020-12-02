using Web.Models.Entidades.Outras;

namespace Web.Models.Contratos.Interfaces
{
   public interface IFormasDePagamentos:IBase<FormasDePagamento>
    {
        string BuscarNomePeloId(int id);
    }
}
