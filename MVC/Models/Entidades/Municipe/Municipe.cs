using System;

namespace MVC.Models.Entidades.Municipe
{
    public class Municipe : Base
    {
        public long MunicipeNm { get; set; }

        public DateTime MunicipeDataNascimento { get; set; }
        public string MunicipeNDocIdent { get; set; }
        public int MunicipeTipoDocIdentificacao { get; set; }
        public DateTime MunicipeDocDataEmissao { get; set; }
        public DateTime MunicipeDocDataValidade { get; set; }
        public string MunicipeNif { get; set; }
        public int MunicipeGenero { get; set; }
        public int MunicipeEstadoCivil { get; set; }
        public string MunicipeTelefone1 { get; set; }
        public string MunicipeTelefone2 { get; set; }
        public String MunicipeEmail { get; set; }




    }
}