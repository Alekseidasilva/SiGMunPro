using Microsoft.AspNet.Identity.EntityFramework;
using System.ComponentModel.DataAnnotations;

namespace Web.Models.Entidades.Usuario
{
    public class UserLogin: IdentityUserLogin<int>
    {
        [Required(ErrorMessage = "O campo login é requerido")]
        public string Email { get; set; }
        [Required(ErrorMessage = "O campo senha é requerido")]
        public string Senha { get; set; }

        public virtual bool PermanecerLogado { get; set; }
        public virtual string ReturnUrl { get; set; }
    }
}