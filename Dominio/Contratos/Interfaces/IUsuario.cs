namespace Dominio.Contratos.Interfaces
{
    public interface IUsuario:IBase<IUsuario>
   {
       IUsuario BuscarPorEmail(string email);
       IUsuario BuscarPorNome(string nome);

   }
}
