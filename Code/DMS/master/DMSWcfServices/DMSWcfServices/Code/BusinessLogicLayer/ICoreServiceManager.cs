using DMSWcfServices.Code.DAL.EF;
using DMSWcfServices.Code.ServiceLayer;

namespace DMSWcfServices.Code.BusinessLogicLayer
{
    public interface ICoreServiceManager
    {
        ServiceInvocationResult putProductionUnstructured(Production prod, bool? allowUpdates);
    }
}