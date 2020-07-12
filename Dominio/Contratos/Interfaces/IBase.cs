using System.Collections.Generic;

namespace Dominio.Contratos.Interfaces
{
    public interface IBase<TEntidade>
    {
        string Cadastrar(TEntidade entidade);
        string Alterar(TEntidade entidade);
        void Excluir(int id);
          TEntidade SelecionarPorNome(int id);
        TEntidade SelecionarPorId(int id);
        IEnumerable<TEntidade> SelecionarTodos();
    }
}
