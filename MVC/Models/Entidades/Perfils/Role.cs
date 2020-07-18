using Microsoft.AspNet.Identity.EntityFramework;
using MVC.Models.Entidades.Usuario;
using System;

namespace MVC.Models.Entidades.Perfils
{
    public class Role : IdentityRole<int, UserRole>
    {
        //public int Id { get; set; }
        //public string Name { get; set; }
        public bool Estado { get; set; }
        public DateTime DataCadastro { get; set; }
    }
}