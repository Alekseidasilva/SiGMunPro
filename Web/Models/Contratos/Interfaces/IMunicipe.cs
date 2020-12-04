using Web.Models.Entidades.Municipe;

namespace Web.Models.Contratos.Interfaces
{
   public interface IMunicipe: IBase<Municipe>
    {
        string BuscarNomePeloId(string id);
        int TotalMunicipesCadastrados();
        Municipe BuscarPeloNMBarcodeQr(string txt);
    }
}
