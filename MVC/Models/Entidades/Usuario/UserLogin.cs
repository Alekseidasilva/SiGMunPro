using System.ComponentModel.DataAnnotations;
using Microsoft.AspNet.Identity.EntityFramework;

namespace MVC.Models.Entidades.Usuario
{
    public class UserLogin : IdentityUserLogin<int>
    {


        [Required]
        public string Email { get; set; }
        [Required]
        public string Senha { get; set; }

        public virtual string ReturnUrl { get; set; }
    }
}