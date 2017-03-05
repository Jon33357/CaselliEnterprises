using System.Collections.Generic;
using CMDBService.App_Code.DAL.EF;

namespace CMDBService.App_Code.BusinessLogicLayer
{
    public interface ICMDBServiceManager
    {
        ICollection<ConfigurationAsset> GetCMDBForKey(string key);
        ICollection<ConfigurationAsset> GetCMDBForKey(string key, string group, string subGroup);
    }
}