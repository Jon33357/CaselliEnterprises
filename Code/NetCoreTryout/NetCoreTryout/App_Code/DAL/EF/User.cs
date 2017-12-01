using System;
using System.Collections.Generic;

namespace NetCoreTryout.App_Code.DAL.EF
{
    public partial class User
    {
        public User()
        {
            UserConfig = new HashSet<UserConfig>();
        }

        public string Name { get; set; }
        public string Key { get; set; }

        public virtual ICollection<UserConfig> UserConfig { get; set; }
    }
}
