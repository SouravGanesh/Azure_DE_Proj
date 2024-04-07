-- Databricks notebook source
-- Querying our master customer table
SELECT * FROM azure_de_terraform_proj.customer WHERE is_active = True LIMIT 2;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #####1st run = 29505
-- MAGIC #####2st run = 29544
-- MAGIC #####3st run = 29544

-- COMMAND ----------

SELECT count(*) FROM azure_de_terraform_proj.customer;

-- COMMAND ----------

-- Querying our featureLoanTrx table with some filters/predicates
SELECT * FROM azure_de_terraform_proj.featureLoanTrx 
WHERE payment_period > 12  
AND category = 'SILVER'
LIMIT 2;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #####1st run = 9613
-- MAGIC #####2st run = 19053
-- MAGIC #####3st run = 28497

-- COMMAND ----------

SELECT count(*) FROM azure_de_terraform_proj.featureLoanTrx;

-- COMMAND ----------

-- Querying our aggLoanTrx table with some filters/predicates
SELECT * FROM azure_de_terraform_proj.aggLoanTrx LIMIT 2;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #####1st run = 70
-- MAGIC #####2st run = 140
-- MAGIC #####3st run = 208

-- COMMAND ----------

SELECT count(*) FROM azure_de_terraform_proj.aggLoanTrx;

-- COMMAND ----------

