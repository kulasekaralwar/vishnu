using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LMS.Server.Startup))]
namespace LMS.Server
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
