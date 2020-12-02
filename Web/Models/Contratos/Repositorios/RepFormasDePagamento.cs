using System;
using System.Collections.Generic;
using System.Data;
using Infra.Data;
using Web.Models.Contratos.Interfaces;
using Web.Models.Entidades.Outras;

namespace Web.Models.Contratos.Repositorios
{
    public class RepFormasDePagamento:IFormasDePagamentos
    {private readonly Conexao _conexao = new Conexao();
        public string Cadastrar(FormasDePagamento entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Alterar(FormasDePagamento entidade)
        {
            throw new System.NotImplementedException();
        }

        public string Excluir(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<FormasDePagamento> BuscarListaPorNome(string nome)
        {
            throw new System.NotImplementedException();
        }

        public FormasDePagamento BuscarEntidadePorId(int id)
        {
            throw new System.NotImplementedException();
        }

        public List<FormasDePagamento> SelecionarTodos()
        {
            throw new System.NotImplementedException();
        }

        public string BuscarNomePeloId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@id", id);
                var nome = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_FormasDePagamentoBuscarNomePeloId");
                string userName = "";
                foreach (DataRow item in nome.Rows)
                {
                    userName = Convert.ToString(item["FormaPagamentoNome"]);
                }

                return userName;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
    
}