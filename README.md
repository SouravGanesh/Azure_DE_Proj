- [Step to deploy Azure Services through Terraform](Terraform/README.md)

 Data Dictionary
I will describe the columns of each file so you can have a better understanding of the data.

Customer: This data needs to be treated with an UPSERT technique because it only send new and modified records daily.
Customer Drivers: This data is generated daily from the RiskModeling area. The data that is sent is an snapshot of the day. This data will be loaded incrementally.
Loan Transactions: Data correspond to the transactions performed in a specific date. This data will be loaded incrementally.
