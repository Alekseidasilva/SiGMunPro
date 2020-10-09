using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.ComponentModel.DataAnnotations;

namespace Web.Models.Entidades.Usuario
{
    public class User: IdentityUser<int, UserLogin, UserRole, UserClaim>
    {
        [Required]
        public string NomeCompleto { get; set; }



        [Required]
        public bool Estado { get; set; }


        public DateTime DataCadastro { get; set; }

        [Required]
        public virtual int PerfilId { get; set; }

        public int IdCadastrador { get; set; }
    }
}