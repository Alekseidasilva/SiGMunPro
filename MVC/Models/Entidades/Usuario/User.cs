using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.ComponentModel.DataAnnotations;

namespace MVC.Models.Entidades.Usuario
{
    public class User : IdentityUser<int, UserLogin, UserRole, UserClaim>
    {
         [Required]
         public string NomeCompleto { get; set; }

         [Required(ErrorMessage = "Email requerido")]
         [DataType(DataType.EmailAddress,ErrorMessage = "Email inválido")]
        public virtual string Email { get; set; }
         [Required]
        public virtual string UserName { get; set; }
         [Required]
        public  bool Estado { get; set; }

        //[DisplayName("Contact Phone")]
        [DataType(DataType.PhoneNumber)]
        [Required(ErrorMessage = "introduza o nº telefone")]
        public virtual string PhoneNumber { get; set; }
        public DateTime DataCadastro { get; set; }

        [Required]
        public virtual int PerfilId { get; set; }


    }
}