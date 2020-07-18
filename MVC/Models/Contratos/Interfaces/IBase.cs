using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVC.Models.Contratos.Interfaces
{
    public interface IBase<TEntidade>
    {
        string Cadastrar(TEntidade entidade);
        string Alterar(TEntidade entidade);
        string Excluir(int id);
        DataTable BuscarPorNome(string nome);
        DataTable BuscarPorEmail(string email);
        DataTable BuscarPorId(int id);
        List<TEntidade> SelecionarTodos();
    }
}
