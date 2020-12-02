using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models.Entidades
{
    public class Operacoes:Base
    {
       
          public string OperacaoMunicipeNM { get; set; }
          public int OperacaoTipoDocumentoId { get; set; }
          public int OperacaoDocsFinalidadeId { get; set; }
          public int OperacaoFormaPagamentoId { get; set; }
          public decimal OperacaoValorTotal { get; set; }
          
    }
}