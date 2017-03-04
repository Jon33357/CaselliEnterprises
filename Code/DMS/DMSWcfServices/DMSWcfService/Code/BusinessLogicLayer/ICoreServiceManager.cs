using DMSWcfService.Code.DAL.EF;
using DMSWcfService.Code.ServiceLayer;

namespace DMSWcfService.Code.BusinessLogicLayer
{
    public interface ICoreServiceManager
    {
        ServiceInvocationResult putProductionUnstructured(Production prod, bool? allowUpdates);
    }
}