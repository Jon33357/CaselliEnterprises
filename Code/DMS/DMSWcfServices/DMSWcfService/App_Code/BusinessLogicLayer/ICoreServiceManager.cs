using DMSWcfService.App_Code.DAL.EF;
using DMSWcfService.App_Code.ServiceLayer;

namespace DMSWcfService.App_Code.BusinessLogicLayer
{
    public interface ICoreServiceManager
    {
        ServiceInvocationResult putProductionUnstructured(Production prod, bool? allowUpdates);
    }
}