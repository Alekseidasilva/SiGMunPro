using Microsoft.AspNet.Identity.EntityFramework;
using Web.Models.Role;
using Web.Models.User;

namespace Web.Contexto
{
    public class ApplicationContext
    :IdentityDbContext<User,Role,int,UserLogin,UserRole,UserClaim>
    {
        public ApplicationContext() 
            : base("ConnString")
        {

        }
    }
}