using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNetCore.Identity;

namespace Dominio.Entidades
{
   public class Role
       :IdentityRole<int,UserRole>
    {

    }
}
