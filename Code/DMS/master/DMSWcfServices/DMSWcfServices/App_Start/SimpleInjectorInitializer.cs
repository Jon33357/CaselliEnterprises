[assembly: WebActivator.PostApplicationStartMethod(typeof(DMSWcfServices.App_Start.SimpleInjectorInitializer), "Initialize")]

namespace DMSWcfServices.App_Start
{
    using System.Reflection;

    using SimpleInjector;
    using SimpleInjector.Integration.Wcf;
    using Code.BusinessLogicLayer;

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

            container.Register<ICoreServiceManager, CoreServiceManager>(Lifestyle.Singleton);
            container.Register<IProductionManager, ProductionManager>(Lifestyle.Singleton);
            container.Register<IPageManager, PageManager>(Lifestyle.Singleton);
        }
    }
}