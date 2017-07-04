---
title: "loop for test"
author: "Chris Chang"
date: "`r Sys.Date()`"
output: 'html_document'
---

```{r, echo=FALSE, warning=FALSE, message=FALSE}
# loading data
autoreport <- read.csv(paste0("D:\\auto_report_testing\\201702\\auto_feb.csv"))
autoreport <- autoreport %>% filter(region %in% c("GC"))

# loop
for (unique_name in unique(autoreport$client_name)){
rmarkdown::render(input = "D://test_jp3.Rmd",
           output_format = "pdf_document",
           output_file = paste("Feb 17 monthly report_", unique_name, ".pdf", sep=''),
           output_dir = "D://pdf", encoding = "UTF-8")
  }

