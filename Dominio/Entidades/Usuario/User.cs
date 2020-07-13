using System;
using System.Collections;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Dominio.Entidades.Usuario
{
    public class User
        :IdentityUser<int,UserLogin,UserRole,UserClaim>
    {
         public string NomeCompleto { get; set; }
        public bool Estado { get; set; }
         public DateTime DataCadastro { get; set; }
    }
}
