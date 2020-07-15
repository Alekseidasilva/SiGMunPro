using System.Collections.Generic;

namespace Dominio.Contratos.Interfaces
{
    public interface IBase<TEntidade>
    {
        string Cadastrar(TEntidade entidade);
        string Alterar(TEntidade entidade);
        void Excluir(int id);
        List<TEntidade> BuscarPorNome(string nome);
        TEntidade BuscarPorId(int id);
        IEnumerable<TEntidade> SelecionarTodos();
    }
}
