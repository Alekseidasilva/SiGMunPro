

using Microsoft.AspNet.Identity.EntityFramework;

namespace Dominio.Entidades
{
    public class User
        :IdentityUser<int,UserLogin,UserRole,UserClaim>
    {
    }
}
