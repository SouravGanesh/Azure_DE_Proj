# Azure Data Processing Pipeline Project

Welcome to the Azure Data Processing Pipeline project, an end-to-end data engineering initiative leveraging the power of the Azure cloud platform. This project is crafted to demonstrate the deployment and management of resources using Terraform, alongside developing a comprehensive data pipeline utilizing Delta Lake and Azure Databricks.

## Overview

This project encapsulates the creation of an end-to-end data pipeline on Azure, employing Delta Lake—an open-source storage layer that ensures ACID transactions and effective metadata handling. Through this pipeline, we orchestrate data movement from the bronze to gold layers, demonstrating incremental load strategies, external table creation for data analytics, and pipeline orchestration, leveraging tools like PySpark, Azure Data Lake Storage (ADLS), Azure Databricks, and Azure Data Factory.

## Architecture

The pipeline adopts Delta Lake architecture, organizing data into bronze, silver, and gold layers, each serving distinct roles in the data transformation journey:

- **Bronze Layer**: Acts as the landing zone for raw data.
- **Silver Layer**: Intermediate layer where data is cleansed, processed, and transformed.
- **Gold Layer**: The final layer, hosting aggregated or refined data, primed for analytics.

## Key Components

- **Azure Resource Group**: Encapsulates related Azure resources.
- **Databricks Workspace**: Offers a collaborative environment for data processing.
- **Azure Data Lake Storage Gen2**: Our chosen storage solution, tailored for large-scale data analytics.
- **Azure Service Principal**: Manages permissions and access, ensuring secure resource interaction.

## Data Ingestion and Transformation Process

1. **Data Upload**: Import your datasets into the bronze layer.
2. **Data Ingestion**: Employ `ingestion` scripts to move data to Databricks, transforming it for the silver layer.
3. **Data Transformation**: Scripts transform and transition data to the silver and then gold layers in Delta format.

## Data Processing and Analytics

- **Data Enrichment**: Scripts in the `enrichment` folder enhance data for specific use cases, storing outcomes in the gold layer.
- **Database Creation**: Utilize the provided script to mount your database over the gold container, facilitating data analytics.

## Testing and Validation

- **Pipeline Verification**: Use the `test_ingestion_pipeline` notebook to ensure the pipeline's functionality.
- **Data Querying**: Post-processing, query database tables to validate data accuracy and integrity.

## Additional Resources

- [Deploying Azure Services with Terraform](Terraform/README.md)
- [Executing Databricks Notebooks](Databricks notebook/README.md)

## Conclusion

By following this project, you'll gain hands-on experience with Azure's data services, understanding how to construct a robust data processing pipeline. Whether you're targeting data analytics, pipeline optimization, or cloud resource management, this project offers a comprehensive learning journey.
