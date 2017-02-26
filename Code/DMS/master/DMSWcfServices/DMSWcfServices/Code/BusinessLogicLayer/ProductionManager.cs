using DMSWcfServices.Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMSWcfServices.Code.BusinessLogicLayer
{
    public class ProductionManager
    {
        //still need to implement dependency injection
        DMSEntities dmsEntities;


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