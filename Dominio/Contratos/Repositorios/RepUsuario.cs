using Dominio.Contratos.Interfaces;
using System;
using System.Collections.Generic;

namespace Dominio.Contratos.Repositorios
{
    public class RepUsuario:IUsuario
    {
        public int Cadastrar(IUsuario entidade)
        {
            throw new NotImplementedException();
        }

        public void Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public void Excluir(IUsuario entidade)
        {
            throw new NotImplementedException();
        }

        public IUsuario SelecionarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<IUsuario> SelecionarTodos()
        {
            throw new NotImplementedException();
        }

        public IUsuario BuscarPorEmail(string email)
        {
            throw new NotImplementedException();
        }

        public IUsuario BuscarPorNome(string nome)
        {
            throw new NotImplementedException();
        }
    }
}
