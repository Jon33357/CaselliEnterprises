using CMDBService.App_Code.BusinessLogicLayer;
using CMDBService.App_Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace CMDBService.App_Code.ServiceLayer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "CMDBService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select CMDBService.svc or CMDBService.svc.cs at the Solution Explorer and start debugging.
    public class CMDBService : ICMDBService
    {
        ICMDBServiceManager cmdbServiceManager;

        //Constructor for DI
        public CMDBService(ICMDBServiceManager cmdbServiceManager)
        {
            this.cmdbServiceManager = cmdbServiceManager;
        }

        public ICollection<ConfigurationAsset> GetCMDB(string key)
        {
            return this.cmdbServiceManager.GetCMDBForKey(key);
        }
    }
}
