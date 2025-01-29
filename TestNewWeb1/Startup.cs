using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TestNewWeb1.Startup))]
namespace TestNewWeb1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
