using System;
using System.Collections.Generic;

namespace NetCoreTryout.App_Code.DAL.EF
{
    public partial class UserConfig
    {
        public string UserName { get; set; }
        public string ConfigName { get; set; }

        public virtual Config ConfigNameNavigation { get; set; }
        public virtual User UserNameNavigation { get; set; }
    }
}
