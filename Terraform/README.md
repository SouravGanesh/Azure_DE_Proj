
# Azure Databricks Deployment Guide

This guide provides a comprehensive walkthrough for deploying Azure Databricks using Terraform, an open-source Infrastructure as Code (IaC) tool. Follow the steps below to deploy various Azure resources and set up your Databricks environment.

## Prerequisites

Ensure you have the following prerequisites met before starting the deployment:

- **Terraform**: Make sure Terraform is installed on your machine. It is the key tool we'll use for deploying the resources.
- **Azure CLI**: Azure Command Line Interface (CLI) must be installed to interact with Azure resources directly from your terminal.
- **Azure Account**: You'll need an Azure account. A free plan suffices for this tutorial.

## What the Script Does

- **Client and Subscription Data**: Retrieves the current Azure and Azure AD (Azure Active Directory) client configurations, along with details about the primary Azure subscription. This information configures resources and associates them with the correct Azure environment and subscription.

- **Resource Group**: Creates a resource group named `dataterraprojprod` to contain all the script-created resources, simplifying management and billing.

- **Storage Account and Containers**: Provisions an Azure Storage Account (`stacdataterraprojprod`) within the resource group, specifying three containers for different data layers: bronze, silver, and gold, for data at various stages of processing and transformation.

- **Databricks Workspace**: Establishes an Azure Databricks workspace (`dbwdataterraprojprod`), facilitating collaborative data exploration, data engineering, and machine learning, linked to the same resource group and location as other resources.

- **Key Vault**: Sets up an Azure Key Vault (`kvterraprojprod`) to securely store and manage secrets, keys, and certificates, with configured access policies, including one for the Azure principal account and Databricks account.

- **Azure AD Application and Service Principal**: Creates an Azure AD application (`databricksapp`) and a related service principal to authenticate and authorize the Databricks application, enabling access to specific Azure resources like the storage account.

- **Role Assignment**: Assigns the "Storage Blob Data Contributor" role to the service principal for the storage account, allowing data access and modification.

- **Key Vault Secrets**: Generates Key Vault secrets to store sensitive information, like the application ID and a password for the Databricks application, ensuring secure credential access.

- **Databricks Cluster**: Sets up a Databricks cluster (`dbcluster01`) in the workspace, configured as a single-node cluster ideal for lightweight workloads and testing, with a link to the storage account through Key Vault-stored secrets for data access.

## Step-by-Step Deployment Guide

### 1. Azure CLI Login

Before deploying any resources with Terraform, authenticate to Azure Cloud:

```shell
az login
```

### 2. Terraform Project Setup

Create a new folder named `Terraform` in your preferred location and include the following files:

- `main.tf`: This is typically the primary file in a Terraform module where you define the actual resources that will be created, modified, or destroyed. main.tf contains the resource definitions and possibly data source configurations. It's where the core logic of your infrastructure as code is implemented.
- `providers.tf`: This file is used to define the providers that Terraform will use to manage resources. Providers are plugins Terraform uses to interact with cloud providers, SaaS providers, and other APIs. In providers.tf, you specify which providers are required for your module, along with any configuration settings that the providers might need, such as region or access credentials. in out project we have used  azurerm, databricks, azuread, and time.
- `variables.tf`: This file declares variables that will be used in the Terraform configuration, allowing for dynamic input that can be different depending on the environment or user input. By using variables, you can customize your configurations without altering the main codebase. variables.tf typically includes declarations and sometimes default values, but the actual values are usually provided at runtime or through tfvars files.


### 3. Terraform Initialization

Initialize Terraform to prepare your working directory and load the necessary providers:

```shell
terraform init
```

### 4. Terraform Plan

Preview the infrastructure changes with the `terraform plan` command to ensure the configurations are as expected:

```shell
terraform plan
```

### 5. Terraform Apply

Apply the Terraform configurations to create and configure the Azure resources:

```shell
terraform apply
```

## Conclusion

After executing these steps, your Azure Databricks environment will be set up and ready for use. This guide ensures a structured approach to deploying Azure resources, making your infrastructure management more efficient and reproducible.
