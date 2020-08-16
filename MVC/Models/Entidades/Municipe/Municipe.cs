using System;

namespace MVC.Models.Entidades.Municipe
{
    public class Municipe:Base
    {
        public int MunicipeNM { get; set; }
       
        public DateTime MunicipeDataNascimento { get; set; }
        public string MunicipeNDocIdent { get; set; }
         public int MunicipeTipoDocIdentificacao { get; set; }
        public DateTime MunicipeDocDataEmissao { get; set; }
        public DateTime MunicipeDocDataValidade { get; set; }
        public string MunicipeNIF { get; set; }
        public int MunicipeGenero { get; set; }
        public int MunicipeEstadoCivil { get; set; }
        public string MunicipeTelefone1 { get; set; }
        public string MunicipeTelefone2 { get; set; }
        public String MunicipeEmail { get; set; }
        public int MunicipeMorada { get; set; }
        public bool MunicipeEstado { get; set; }
        

    }
}