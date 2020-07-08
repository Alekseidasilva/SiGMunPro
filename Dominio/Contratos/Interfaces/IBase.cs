using System.Collections.Generic;

namespace Dominio.Contratos.Interfaces
{
    public interface IBase<TEntidade>
    {
        int Cadastrar(TEntidade entidade);
        void Excluir(int id);
        void Excluir(TEntidade entidade);
        TEntidade SelecionarPorId(int id);
        IEnumerable<TEntidade> SelecionarTodos();
    }
}
