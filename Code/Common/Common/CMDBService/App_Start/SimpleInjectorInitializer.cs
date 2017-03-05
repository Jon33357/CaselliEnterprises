[assembly: WebActivator.PostApplicationStartMethod(typeof(CMDBService.App_Start.SimpleInjectorInitializer), "Initialize")]

namespace CMDBService.App_Start
{
    using System.Reflection;

    using SimpleInjector;
    using SimpleInjector.Integration.Wcf;
    using App_Code.BusinessLogicLayer;

    public static class SimpleInjectorInitializer
    {
        /// <summary>Initialize the container and register it for the WCF ServiceHostFactory.</summary>
        public static void Initialize()
        {
            var container = new Container();
            container.Options.DefaultScopedLifestyle = new WcfOperationLifestyle();

            InitializeContainer(container);

            container.RegisterWcfServices(Assembly.GetExecutingAssembly());

            container.Verify();
            
            SimpleInjectorServiceHostFactory.SetContainer(container);

            // TODO: Add the following attribute to all .svc files:
            // Factory="SimpleInjector.Integration.Wcf.SimpleInjectorServiceHostFactory, SimpleInjector.Integration.Wcf"
        }

        private static void InitializeContainer(Container container)
        {
            //Register your services here.
            // For instance:
            // container.Register<IUserRepository, SqlUserRepository>(Lifestyle.Scoped);
            container.Register<ICMDBServiceManager, CMDBServiceManager>(Lifestyle.Singleton);
        }
    }
}