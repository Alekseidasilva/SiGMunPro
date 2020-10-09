using Infra.Data;
using System;
using System.Collections.Generic;
using System.Data;

namespace Web.Models.Contratos.Repositorios
{
    public class RepGenerico
    {

        private readonly Conexao _conexao = new Conexao();
        #region Genero
        public List<object> CarregarGeneros()
        {
            try
            {
                _conexao.LimparParametro();
                DataTable genero = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarGeneros");
                List<object> gerenos = new List<object>();
                foreach (DataRow item in genero.Rows)
                {

                }
                return gerenos;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        public string CarregarGenerosPorId(int id)
        {
            try
            {
                _conexao.LimparParametro();
                _conexao.AdicionarParametros("@Id", id);
                DataTable genero = _conexao.ExecutarConsulta(CommandType.StoredProcedure, "SP_CarregarGeneroPorId");
                string gereros = "";
                foreach (DataRow item in genero.Rows)
                {
                    gereros = Convert.ToString(item["generoNome"]);
                }
                return gereros;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        #endregion
    }
}