using System;

namespace MVC.Models.Entidades
{
    public class Base
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public DateTime DataCadastro { get; set; }
        public bool Estado { get; set; }
        public int Idcadastrador { get; set; }

    }
}