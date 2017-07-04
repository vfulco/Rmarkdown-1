---
title: "loop_auto3"
author: "Chris"
date: "June 15, 2017"
output: html_document
---

```{r}
# sys
library(knitr)
library(markdown)
library(rmarkdown)
# language
library(rticles)
library(showtext)
library(extrafont)
# plot
library(ggplot2)
library(ggthemes)
library(ggalt)
library(scales)
library(lubridate)
library(reshape2)
# table
library(grid)
library(dplyr)
library(gridExtra)
library(cowplot)
library(gtable)
library(data.table)
library(formattable)
# forecasting  
library(prophet)
library(forecast)
library(xts)
library(astsa)
# IQR
library(scales)

# loading data
autoreport <- read.csv(paste0("N:\\_Automated report\\raw_data\\auto_may.csv"))

# loop for regions
if(autoreport$country %in% c("South Korea")) {
  autoreport <- autoreport %>% filter(country %in% c("South Korea"))
  autoreport <- autoreport %>% filter(!(grepl("lottehotel", client_name)))
  
  for (unique_name in unique(autoreport$client_name)) {
    rmarkdown::render(input = "N:\\_Automated report\\Rmarkdown\\test_kr3.Rmd",
                      output_format = "pdf_document",
                      output_file = paste("May 17 monthly report_", unique_name, ".pdf", sep=''),
                      output_dir = "D:\\pdf\\KR", encoding = "UTF-8")
    }
} else if(autoreport$country %in% c("China","Hong Kong","Taiwan")) {
  autoreport <- autoreport %>% filter(country %in% c("China","Hong Kong","Taiwan"))
  autoreport <- autoreport %>% filter(!(grepl("imomoko", client_name)))
  
  for (unique_name in unique(autoreport$client_name)) {
    rmarkdown::render(input = "N:\\_Automated report\\Rmarkdown\\test_cn4.Rmd",
                      output_format = "pdf_document",
                      output_file = paste("May 17 monthly report_", unique_name, ".pdf", sep=''),
                      output_dir = "D:\\pdf\\GC", encoding = "UTF-8")
  }
} else if(autoreport$country %in% c("Japan")) {
  autoreport <- autoreport %>% filter(country %in% c("Japan"))
  autoreport <- autoreport %>% filter(!(grepl("lovetoy", client_name)))
  
  for (unique_name in unique(autoreport$client_name)) {
    rmarkdown::render(input = "N:\\_Automated report\\Rmarkdown\\test_jp4.Rmd",
                      output_format = "pdf_document",
                      output_file = paste("May 17 monthly report_", unique_name, ".pdf", sep=''),
                      output_dir = "D:\\pdf\\JP", encoding = "UTF-8")
  }
} else if(autoreport$country %in% c("SME")) {
  autoreport <- autoreport %>% filter(country %in% c("SME"))
  autoreport <- autoreport %>% filter(client_name != c("Ewigsfr"))
  
  for (unique_name in unique(autoreport$client_name)) {
    rmarkdown::render(input = "N:\\_Automated report\\Rmarkdown\\test_v3b.Rmd",
                      output_format = "pdf_document",
                      output_file = paste("May 17 monthly report_", unique_name, ".pdf", sep=''),
                      output_dir = "D:\\pdf\\SME", encoding = "UTF-8")
  }
} else if(autoreport$country %in% c("Australia","New Zealand")) {
  autoreport <- autoreport %>% filter(country %in% c("Australia","New Zealand"))

  for (unique_name in unique(autoreport$client_name)) {
    rmarkdown::render(input = "N:\\_Automated report\\Rmarkdown\\test_v3b.Rmd",
                      output_format = "pdf_document",
                      output_file = paste("May 17 monthly report_", unique_name, ".pdf", sep=''),
                      output_dir = "D:\\pdf\\ANZ", encoding = "UTF-8")
  }
} else if(autoreport$country %in% c("Vietnam","Tuvalu","Tonga","Thailand","Sri Lanka",
                                    "Singapore","Philippines","New Caledonia","Malaysia",
                                    "Laos","Indonesia","India","Fiji","Cambodia",
                                    "Bangladesh","American Samoa","French Polynesia")) {
  autoreport <- autoreport %>% filter(country %in% c("Vietnam","Tuvalu","Tonga","Thailand","Sri Lanka",
                                                   "Singapore","Philippines","New Caledonia",
                                                   "Malaysia","Laos","Indonesia","India",
                                                   "Fiji","Cambodia","Bangladesh","American Samoa",
                                                   "French Polynesia"))
  
  for (unique_name in unique(autoreport$client_name)) {
    rmarkdown::render(input = "N:\\_Automated report\\Rmarkdown\\test_v3b.Rmd",
                      output_format = "pdf_document",
                      output_file = paste("May 17 monthly report_", unique_name, ".pdf", sep=''),
                      output_dir = "D:\\pdf\\SME", encoding = "UTF-8")
  }
} else {
  
  for (unique_name in unique(autoreport$client_name)) {
    rmarkdown::render(input = "N:\\_Automated report\\Rmarkdown\\test_v3b.Rmd",
                      output_format = "pdf_document",
                      output_file = paste("May 17 monthly report_", unique_name, ".pdf", sep=''),
                      output_dir = "D:\\pdf\\APAC", encoding = "UTF-8")
    }
}
```