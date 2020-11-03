using System.Collections.Generic;
using Infra.Data;

namespace Web.Models.Contratos.Interfaces
{
    
   public interface IBase<TEntidade>
    {
     

        string Cadastrar(TEntidade entidade);
        string Alterar(TEntidade entidade);
        string Excluir(int id);
        List<TEntidade> BuscarPorNome(string nome);

        TEntidade BuscarPorId(int id);
        List<TEntidade> SelecionarTodos();
    }
}
