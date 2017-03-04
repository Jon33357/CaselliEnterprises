using DMSWcfService.Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMSWcfService.Code.BusinessLogicLayer
{
    public class SimpleEntitiesManager : ISimpleEntitiesManager
    {
        DMSEntities dmsEntities;

        //contructor for DI
        public SimpleEntitiesManager(DMSEntities dmsEntities)
        {
            this.dmsEntities = dmsEntities;
        }

        public void CreateClient(Client client)
        {
            using (DMSEntities dmsEntities = this.dmsEntities){
                dmsEntities.Client.Add(client);
                dmsEntities.SaveChanges();
            }
        }

        public void CreateProductionType(ProductionType productionType)
        {
            using (DMSEntities dmsEntities = this.dmsEntities)
            {
                dmsEntities.ProductionType.Add(productionType);
                dmsEntities.SaveChanges();
            }
        }

    }
}