using System.Collections.Generic;

namespace Dominio.Contratos.Interfaces
{
    public interface IBase<TEntidade>
    {
        string Cadastrar(TEntidade entidade);
        string Alterar(TEntidade entidade);
        string Excluir(int id);
        List<TEntidade> BuscarPorNome(string nome);
        TEntidade BuscarPorId(int id);
        IEnumerable<TEntidade> SelecionarTodos();
    }
}
