using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DMSWcfServices.Code.DAL.EF;

namespace DMSWcfServices.Code.ServiceLayer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICoreService" in both code and config file together.
    [ServiceContract]
    public interface ICoreService
    {
        [OperationContract]
        ServiceInvocationResult putProductionStructured();

        [OperationContract]
        ServiceInvocationResult putProductionUnstructured(Production prod, bool? allowUpdates);
    }

}
