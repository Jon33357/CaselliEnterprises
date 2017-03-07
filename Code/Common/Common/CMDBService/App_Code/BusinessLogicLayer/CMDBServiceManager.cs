using CMDBService.App_Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMDBService.App_Code.BusinessLogicLayer
{
    public class CMDBServiceManager : ICMDBServiceManager
    {

        CMDBEntities cmdbEntities;

        public CMDBServiceManager(CMDBEntities cmdbEntities)
        {
            this.cmdbEntities = cmdbEntities;
        }


        public ICollection<ConfigurationAsset> GetCMDBForKey(string key)
        {
            using (CMDBEntities ctx = this.cmdbEntities)
            {
                var query = from ca in ctx.ConfigurationAssets.AsNoTracking() from ak in ca.AccessKeys where ak.key==key select ca;

                ICollection<ConfigurationAsset> configAssets = query.ToList<ConfigurationAsset>();
                return configAssets;
            }
        }

        public ICollection<ConfigurationAsset> GetCMDBForKey(string key, string group, string subGroup)
        {
            using (CMDBEntities ctx = this.cmdbEntities)
            {
                var query = from ca in ctx.ConfigurationAssets.AsNoTracking() from ak in ca.AccessKeys where ak.key == key select ca;
                if(!String.IsNullOrWhiteSpace(group))
                    query = query.Where(ca => ca.group == group);
                if(!String.IsNullOrWhiteSpace(subGroup))
                    query = query.Where(ca => ca.subgroup == subGroup);


                ICollection<ConfigurationAsset> configAssets = query.ToList<ConfigurationAsset>();
                return configAssets;
            }

        }
    }
}