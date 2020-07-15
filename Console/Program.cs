using System.Linq;
using Dominio.Contratos.Repositorios;
using Dominio.Entidades.Usuario;

namespace Console
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Console.WriteLine("Escreva o Nome");
            string nome = System.Console.ReadLine();
            RepUsuario repUsuario=new RepUsuario();
            var users = repUsuario.BuscarPorNome(nome);
            foreach (var item in users)
            {
                if (item.UserName.Equals(nome))
                {
                    System.Console.WriteLine("Registo encontrado : "+item.UserName);
                }
            }

            System.Console.ReadKey();
        }
    }
}
