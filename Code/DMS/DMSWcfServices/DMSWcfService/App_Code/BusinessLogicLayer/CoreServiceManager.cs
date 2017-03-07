using DMSWcfService.App_Code.DAL.EF;
using DMSWcfService.App_Code.ServiceLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMSWcfService.App_Code.BusinessLogicLayer
{
    public class CoreServiceManager : ICoreServiceManager
    {
        IProductionManager prodManager;
        IPageManager pageManager;
        ISimpleEntitiesManager simpleEntitiesManager;

        //contructor for DI
        public CoreServiceManager(IProductionManager prodManager, IPageManager pageManager, ISimpleEntitiesManager simpleEntitiesManager) {
            this.prodManager = prodManager;
            this.pageManager = pageManager;
            this.simpleEntitiesManager = simpleEntitiesManager;
        }

        //still need to implement transactionality in DB access
        public ServiceInvocationResult putProductionUnstructured(Production prod, bool? allowUpdates)
        {
            if (prod == null) throw new ArgumentException("prod argument cannot be null!", "prod");

            bool _allowUpdates = false;
            if (allowUpdates != null && allowUpdates==true)
                _allowUpdates = true;


            //first create production
            try{
                prodManager.createProduction(prod);
            }
            catch (Exception ex) {//replace with appropriate exception to catch duplicate primary key exception
                if (_allowUpdates)
                    prodManager.updateProduction(prod);
                else
                    return new ServiceInvocationResult((int)ServiceInvocationResultCode.UpdatesNotAllowed,
                        "production " + prod.id + " already exist in system and allowUpdates not set to true!",
                        ex.Message, ex);
            }

            //then create pages
            if (prod.Pages != null && prod.Pages.Count > 0) {
                foreach (Page page in prod.Pages) {
                    try{
                        pageManager.createPage(page);
                    }
                    catch (Exception ex){//replace with appropriate exception to catch duplicate primary key exception
                        if (_allowUpdates)
                            pageManager.updatePage(page);
                        else
                            return new ServiceInvocationResult((int)ServiceInvocationResultCode.UpdatesNotAllowed,
                                "page with productionId=" + page.production_id + " and pageNumber=" + page.page_number + " already exist in system and allowUpdates not set to true!",
                                ex.Message, ex);
                    }
                }
            }


            return new ServiceInvocationResult((int)ServiceInvocationResultCode.OK, null, null, null);
        }

        public ServiceInvocationResult createClient(Client client)
        {
            try{
                this.simpleEntitiesManager.CreateClient(client);
                return new ServiceInvocationResult((int)ServiceInvocationResultCode.OK, null, null, null);
            }
            catch (Exception ex) {
                return new ServiceInvocationResult((int)ServiceInvocationResultCode.InternalError, ex.Message, ex.StackTrace, ex);
            }
        }
        public ServiceInvocationResult createProduCtionType(ProductionType productionType)
        {
            try
            {
                this.simpleEntitiesManager.CreateProductionType(productionType);
                return new ServiceInvocationResult((int)ServiceInvocationResultCode.OK, null, null, null);
            }
            catch (Exception ex)
            {
                return new ServiceInvocationResult((int)ServiceInvocationResultCode.InternalError, ex.Message, ex.StackTrace, ex);
            }
        }
    }
}