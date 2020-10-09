using Microsoft.AspNet.Identity.EntityFramework;
using System;
using Web.Models.Entidades.Usuario;

namespace Web.Models.Entidades.Perfis
{
    public class Role: IdentityRole<int, UserRole>
    {
        //public int Id { get; set; }
        //public string Name { get; set; }
        public bool Estado { get; set; }
        public DateTime DataCadastro { get; set; }
        public int IdCadastrador { get; set; }
    }
}