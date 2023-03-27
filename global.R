
# import packages ---------------------------------------------------------

library(tidyverse)
library(shiny)
library(shinythemes)
library(data.table)
library(future)
library(promises)
library(DT)
library(fireData)


Sys.setenv(api_key = "AIzaSyAzDFMFVBtuEgoJe2H22ZMY-Jyx1yifrnc")
Sys.setenv(db_url = "https://cills-table-default-rtdb.firebaseio.com" )


lapply(list.files("R"), FUN = function(x) source(paste0("R/", x)))

