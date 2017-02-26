namespace AccountingWcfServices.Code.DAL
{
    using AccountingWcfServices.Code.DAL.EF;

    public class DAL {
        public int populateModel() {
            using (var accountingEntities = new AccountingEntities()) {
                accountingEntities.account_document
            }

            return 0;
        }
    }
}

