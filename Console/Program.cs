using System.Linq;
using Dominio.Contratos.Repositorios;
using Dominio.Entidades.Usuario;

namespace Console
{
    class Program
    {
        static void Main(string[] args)
        {

            RepUsuario repUsuario=new RepUsuario();
            var users = repUsuario.SelecionarTodos();
            //foreach (var item in users.FirstOrDefault(user => )
            //{
                
            //}


        }
    }
}
