using System;
using System.Collections.Generic;
using DMSWcfService.App_Code.DAL.EF;

namespace DMSWcfService.App_Code.BusinessLogicLayer
{
    public interface IPageManager
    {
        void createPage(Page page);
        void createPages(ICollection<Page> pages);
        Page getPage(Guid productionId, int pageNumber);
        ICollection<Page> getPages();
        void updatePage(Page page);
        void updatePages(ICollection<Page> pages);
    }
}