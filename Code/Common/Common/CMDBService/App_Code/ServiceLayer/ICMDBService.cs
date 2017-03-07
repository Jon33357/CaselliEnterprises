using CMDBService.App_Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace CMDBService.App_Code.ServiceLayer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICMDBService" in both code and config file together.
    [ServiceContract]
    public interface ICMDBService
    {
        [OperationContract]
        ICollection<ConfigurationAsset> GetCMDB(string key);
    }
}
