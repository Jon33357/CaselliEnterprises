using System;
using System.Collections.Generic;

namespace NetCoreTryout.App_Code.DAL.EF
{
    public partial class Config
    {
        public Config()
        {
            UserConfig = new HashSet<UserConfig>();
        }

        public string Name { get; set; }
        public string Value { get; set; }

        public virtual ICollection<UserConfig> UserConfig { get; set; }
    }
}
