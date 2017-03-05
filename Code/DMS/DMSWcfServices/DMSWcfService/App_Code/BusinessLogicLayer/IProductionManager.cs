using System;
using System.Collections.Generic;
using DMSWcfService.App_Code.DAL.EF;

namespace DMSWcfService.App_Code.BusinessLogicLayer
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