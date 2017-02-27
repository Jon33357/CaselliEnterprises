using DMSWcfServices.Code.DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMSWcfServices.Code.BusinessLogicLayer
{
    public class PageManager : IPageManager
    {
        //still need to implement dependency injection
        DMSEntities dmsEntities;

        public void createPages(ICollection<Page> pages)
        {

        }

        public void createPage(Page page)
        {

        }

        public void updatePages(ICollection<Page> pages)
        {

        }

        public void updatePage(Page page)
        {

        }

        public Page getPage(System.Guid productionId, int pageNumber)
        {
            throw new NotImplementedException();
        }

        public ICollection<Page> getPages()
        {
            throw new NotImplementedException();
        }
        
    }
}