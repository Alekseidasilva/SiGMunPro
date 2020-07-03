using Microsoft.AspNet.Identity.EntityFramework;
using Web.Models.Role;

namespace Web.Models.User
{
    public class User
    :IdentityUser<int,UserLogin,UserRole,UserClaim>
    {
    }
}