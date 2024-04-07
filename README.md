Overview:
end to end data engineering project on azure colud plotform. deployed and managed resourses from terraform. develop an end-to-end data pipeline using Delta Lake which is an open-source storage layer that provides ACID transactions and metadata handling. Also we use databrck notebooks to data moves from bronze to gold container, how to make an incremental load, create external tables for data analysis and orchestrate your pipeline. We will use technologies such as PySpark, ADSLS, Azure Databricks, Azure Data Factory 

few things about terraform....
- [Step to deploy Azure Services through Terraform](Terraform/README.md)
# Azure Data Processing Pipeline

Welcome to our Azure Data Processing Pipeline project! This initiative is designed to harness the power of Azure services to build a sophisticated data processing framework. Whether you're a seasoned expert or new to Azure, we'll walk you through the essentials of what we're building and how everything ties together.

## Project Overview

In this project, we've laid the groundwork for a data processing pipeline using several Azure services. Our goal is to create a scalable, secure, and efficient pipeline that transitions data through different stages, ultimately transforming raw data into insightful information.

## Architecture

We're implementing the Delta Lake Architecture, organizing our data into three layers known as bronze, silver, and gold. Each layer serves a specific purpose:

- **Bronze**: The initial landing zone for raw data.
- **Silver**: Where data is cleansed, processed, and transformed.
- **Gold**: The final layer, containing aggregated or refined data, ready for analytics.

## Key Components

- **Azure Resource Group**: The container that holds related resources for our Azure solution.
- **Databricks Workspace**: Provides a collaborative environment with a single-node cluster for processing data.
- **Azure Data Lake Storage Gen2**: Acts as our storage solution, optimized for large-scale data analytics.
- **Azure Service Principal**: A service account that helps manage permissions and access to Azure resources securely.

## Setting Up the Environment

1. **Create Azure Resources**: Begin by setting up the resource group, Databricks workspace, and storage account.
2. **Initialize Data Layers**: Organize your storage account into three containers corresponding to the bronze, silver, and gold layers.
3. **Configure Azure Service Principal**: Set up the Service Principal in Azure Active Directory, granting it the necessary permissions to interact with your resources.

    - Navigate to Azure Active Directory.
    - Click on App registrations, then New Registration.
    - Assign the "Storage Blob Data Contributor" role to the Service Principal for your storage account.

4. **Secure Your Connections**: Store your Databricks access token and other secrets securely using Azure Key Vault.

Use Case Explanation
We will be working with transactional data referred to loan transactions and customers from GeekBankPE (a famous bank around the world).

You have two requirements from different areas of the bank.

The Marketing area needs to have updated customer data to be able to contact them and make offers.
The Finance area requires to have daily loan transactions complemented with customer drivers to be able to analyze them and improve the revenue.
To comply with the request, we are going to perform incremental loads and also using techniques like upsert.

Architecture
We are going to work following the delta lake architecture.

Bronze: Raw data (Data stored in original format)
Silver: Transformed data (Data stored in delta format)
Gold: Feature/Agg data (Data stored in delta format)




 Data Dictionary
I will describe the columns of each file so you can have a better understanding of the data.

Customer: This data needs to be treated with an UPSERT technique because it only send new and modified records daily.
Customer Drivers: This data is generated daily from the RiskModeling area. The data that is sent is an snapshot of the day. This data will be loaded incrementally.
Loan Transactions: Data correspond to the transactions performed in a specific date. This data will be loaded incrementally.


after the note books in databricks folders are ran we have the we have the final data in gold container in delta formate.
 Creating database
Copy the below code to the database notebook and execute it. Once execution finish you have mounted your database over the gold container.

Note: If you drop your database which is mounted on your gold container, all the files inside that container are going to be deleted too.

"CREATE EXTERNAL TABLE I in enrichment folder databricks notebook after saving data in gold layer.

finally test the notebook
Querying database tables from SQL notebook

