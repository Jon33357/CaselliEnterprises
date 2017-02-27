using System;
using System.Collections.Generic;
using DMSWcfServices.Code.DAL.EF;

namespace DMSWcfServices.Code.BusinessLogicLayer
{
    public interface IProductionManager
    {
        void createProduction(Production prod);
        Production getProduction(long? indexingUnitId);
        Production getProduction(Guid id);
        ICollection<Production> getProductions();
        void updateProduction(Production prod);
    }
}