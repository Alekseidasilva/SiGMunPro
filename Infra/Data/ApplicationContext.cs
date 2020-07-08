using Dominio.Entidades;
using Microsoft.AspNet.Identity.EntityFramework;


namespace Infra.Data
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
