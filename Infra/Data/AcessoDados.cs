using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Infra.Data
{
    public class AcessoDados
    {
        public SqlConnection CriarConexao()
        {
            var stringConexao = ConfigurationManager.ConnectionStrings["ConnString"].ToString();
            return new SqlConnection("stringConexao");
        }
        //Parametros que vão para o banco de Dados
        private SqlParameterCollection sqlParameterCollection = new SqlCommand().Parameters;
        //metodo para limpar a coleção de parametros
        public void LimparParametro()
        {
            sqlParameterCollection.Clear();
        }
        public void AdicionarParametros(string nomeParametro, object valorParametro)
        {
            //Criamos dois novos parametro para a nossa colecºão de parametros
            sqlParameterCollection.Add(new SqlParameter(nomeParametro, valorParametro));
        }

        //Persistencia- Inserir -Alterar-Excluir
        public object ExecutarManipulacao(CommandType commandType, string nomeStoredProcedureOUTextSql)
        {
            //Tratamento de Excepção
            try
            {
                //Criar a conexão
                SqlConnection sqlConnection = CriarConexao();
                //Abrir a conexao
                sqlConnection.Open();

                //Criar comando que 
                SqlCommand sqlcommand = sqlConnection.CreateCommand();
                //colocando as coisas dento do comando (dentro da caixa que vai trafegar na conexao)
                sqlcommand.CommandType = commandType;
                sqlcommand.CommandText = nomeStoredProcedureOUTextSql;
                sqlcommand.CommandTimeout = 7200;// Tempo de conexão ate fechar

                //Adicionar os Parametros no Comando
                foreach (SqlParameter sqlParameter in sqlParameterCollection) //Percorra em cada um ou para casa um
                {
                    sqlcommand.Parameters.Add(new SqlParameter(sqlParameter.ParameterName, sqlParameter.Value));
                }

                //executar o comando ou seja mandar ir ate o banco de dados
                return sqlcommand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);

            }
        }

        //Consultar Registos do Banco de Dados
        public DataTable ExecutarConsulta(CommandType commandType, String nomeStoredProcedureOuTextSql)
        {
            try
            {
                //Criar a conexão
                SqlConnection sqlConnection = CriarConexao();
                //Abrir a conexao
                sqlConnection.Open();
                //Criar comando que 
                SqlCommand sqlcommand = sqlConnection.CreateCommand();
                //colocando as coisas dento do comando (dentro da caixa que vai trafegar na conexao)
                sqlcommand.CommandType = commandType;
                sqlcommand.CommandText = nomeStoredProcedureOuTextSql;
                sqlcommand.CommandTimeout = 7200;// Tempo de conexão ate fechar
                                                 //Adicionar os Parametros no Comando
                foreach (SqlParameter sqlParameter in sqlParameterCollection) //Percorra em cada um ou para casa um
                {
                    sqlcommand.Parameters.Add(new SqlParameter(sqlParameter.ParameterName, sqlParameter.Value));
                }

                //Criar um Adaptador
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlcommand);
                //Datatbale = Tabela de dados varia onde vou colocar os dados que vêm do banco de dados
                DataTable datatable = new DataTable();

                //Mandar o Comando ir até o banco buscar os dados e o Adaptador preencher o datatable
                sqlDataAdapter.Fill(datatable);

                return datatable;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);

            }
        }


    }
}

