using DMSWcfService.Code.DAL.EF;

namespace DMSWcfService.Code.BusinessLogicLayer
{
    public interface ISimpleEntitiesManager
    {
        void CreateClient(Client client);
        void CreateProductionType(ProductionType productionType);
    }
}