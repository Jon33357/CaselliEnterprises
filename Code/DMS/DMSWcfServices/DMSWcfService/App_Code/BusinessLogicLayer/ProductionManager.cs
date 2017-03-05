using DMSWcfService.App_Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMSWcfService.App_Code.BusinessLogicLayer
{
    public class ProductionManager : IProductionManager
    {
        DMSEntities dmsEntities;

        //contructor for DI
        public ProductionManager(DMSEntities dmsEntities) {
            this.dmsEntities = dmsEntities;
        }


        public void createProduction(Production prod)
        {

        }


        public void updateProduction(Production prod)
        {

        }


        public Production getProduction(System.Guid id)
        {
            throw new NotImplementedException();
        }

        public Production getProduction(Nullable<long> indexingUnitId)
        {
            throw new NotImplementedException();
        }

        public ICollection<Production> getProductions()
        {
            throw new NotImplementedException();
        }
    }
}