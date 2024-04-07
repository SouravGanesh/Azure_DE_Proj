## Overview

The workflow includes data ingestion, transformation, and enrichment within a Databricks environment, utilizing Azure Storage Gen2 as the underlying storage mechanism.

## Deployment and Configuration

1. **Azure Resources Setup**: Use Terraform to deploy and configure the necessary Azure resources. Ensure you have the Azure CLI configured and authenticated.

2. **Mount Storage Containers**: Use the script located in `set_up/adsl_mount_storage` to mount the Azure Storage Gen2 containers to Databricks.

## Data Ingestion and Transformation

1. **Upload Dataset**: Place your initial datasets (csv files) into the bronze layer container in Azure Storage.

2. **Ingest Data**: Utilize the scripts in the `ingestion` folder to ingest data from the bronze container to the Databricks environment. This process includes essential data transformation steps, preparing the data for the silver layer.

3. **Transformation**: The ingestion scripts will transform the data and store it in the silver container in a Delta format.

2. **Enrichment**: Utilize the scripts in the `enrichment` folder to further process and enrich the data based on the defined use cases. The enriched data is derived from the silver container and stored in gold container.

## Testing

- **Pipeline Testing**: The `test_ingestion_pipeline` notebook in the `utility` folder is designed to test the data ingestion and transformation pipeline, ensuring that the entire process operates smoothly.

