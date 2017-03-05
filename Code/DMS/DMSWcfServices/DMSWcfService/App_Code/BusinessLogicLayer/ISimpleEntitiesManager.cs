using DMSWcfService.App_Code.DAL.EF;

namespace DMSWcfService.App_Code.BusinessLogicLayer
{
    public interface ISimpleEntitiesManager
    {
        void CreateClient(Client client);
        void CreateProductionType(ProductionType productionType);
    }
}