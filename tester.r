# Databricks notebook source
# here to load packages
library(dplyr)
library(RODBC)
library(tidyr)
library(lubridate)

# COMMAND ----------

qs <- "
select * from MSS_U_NAD_S.DOPP_OPPORTUNITY_DETAILS_2019
"
datasource <-
RevoScaleR::RxOdbcData(
sqlQuery = qs,
connectionString = connection_String,
rowBuffering = F
)
rxImport(datasource, paste0(input, '/dopp.xdf'),overwrite = T)
dopp <- rxReadXdf(paste0(input, '/dopp.xdf'))
