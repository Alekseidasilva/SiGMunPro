using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_06_Web.Startup))]
namespace _06_Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //ConfigureAuth(app);
        }
    }
}
