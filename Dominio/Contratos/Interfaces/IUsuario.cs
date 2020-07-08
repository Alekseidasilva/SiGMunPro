namespace Dominio.Contratos.Interfaces
{
    public interface IUsuario:IBase<IUsuario>
   {
       IUsuario BuscarPorEmail(string email);
       IUsuario BuscarPorNome(string nome);
       IUsuario Login(string email, string senha);
       void alterarSenha(string senhaAntiga, string senhanova, string confirmarSenha);

   }
}
