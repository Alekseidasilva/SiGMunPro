using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.Models.Entidades
{
public class Base
    {
        public int Id { get; set; }  
        public string Nome { get; set; } 
        public int DataCadastro { get; set; } 
         public int Idcadastrador { get; set; } 
        
    }
}