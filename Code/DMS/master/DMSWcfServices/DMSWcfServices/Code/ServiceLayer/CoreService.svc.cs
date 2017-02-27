using DMSWcfServices.Code.BusinessLogicLayer;
using DMSWcfServices.Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;




namespace DMSWcfServices.Code.ServiceLayer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "CoreService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select CoreService.svc or CoreService.svc.cs at the Solution Explorer and start debugging.
    public class CoreService : ICoreService
    {
        //still need to implement dependency injection
        ICoreServiceManager coreServiceManager;


        ServiceInvocationResult ICoreService.putProductionUnstructured(Production prod, bool? allowUpdates)
        {

            return this.coreServiceManager.putProductionUnstructured(prod, allowUpdates);

        }

        ServiceInvocationResult ICoreService.putProductionStructured()
        {
            throw new NotImplementedException();
        }
    }
}
