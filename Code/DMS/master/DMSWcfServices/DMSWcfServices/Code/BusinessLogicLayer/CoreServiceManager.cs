using DMSWcfServices.Code.DAL.EF;
using DMSWcfServices.Code.ServiceLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMSWcfServices.Code.BusinessLogicLayer
{
    public class CoreServiceManager
    {
        //still need to implement dependency injection
        ProductionManager prodManager;
        PageManager pageManager;

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
            if (prod.Page != null && prod.Page.Count > 0) {
                foreach (Page page in prod.Page) {
                    try{
                        pageManager.createPage(page);
                    }
                    catch (Exception ex){//replace with appropriate exception to catch duplicate primary key exception
                        if (_allowUpdates)
                            pageManager.updatePage(page);
                        else
                            return new ServiceInvocationResult((int)ServiceInvocationResultCode.UpdatesNotAllowed,
                                "page with produstionId=" + page.production_id + " and pageNumber=" + page.page_number + " already exist in system and allowUpdates not set to true!",
                                ex.Message, ex);
                    }
                }
            }


            return new ServiceInvocationResult((int)ServiceInvocationResultCode.OK, null, null, null);
        }

    }
}