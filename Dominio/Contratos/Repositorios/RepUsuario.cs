using Dominio.Contratos.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using Dominio.Contexto;
using Dominio.Entidades.Usuario;


namespace Dominio.Contratos.Repositorios
{
    public class RepUsuario : IUsuario
    {
        public string Alterar(User entidade)
        {
            throw new NotImplementedException();
        }

        public void AlterarSenha(string senhaAntiga, string senhanova, string confirmarSenha)
        {
            throw new NotImplementedException();
        }

        public User BuscarPorEmail(string email)
        {
            throw new NotImplementedException();
        }

        public User BuscarPorNome(string nome)
        {
            throw new NotImplementedException();
        }

        public string Cadastrar(User entidade)
        {
            throw new NotImplementedException();
        }

        public void Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public void Excluir(User entidade)
        {
            throw new NotImplementedException();
        }

        public User Login(string email, string senha)
        {
            throw new NotImplementedException();
        }

        public User SelecionarPorId(int id)
        {
             throw new NotImplementedException();
        }

        public User SelecionarPorNome(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> SelecionarTodos()
        {
            var res=new List<User>();
            using (var ctx=new ApplicationContext())
            {
                res = ctx.Users.ToList();
            }

            return res;
        }
    }
}
