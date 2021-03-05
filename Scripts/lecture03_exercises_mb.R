library(tidyverse)
library(readxl)
library(writexl)
## vaccination example ----
fname <- "Datasets/expression_data_vaccination_example.xlsx"
excel_sheets(fname)

data <- read_excel(fname, "targets")
sel.data <- select(data, SUBJ, ID, Timepoint)

res <- pivot_wider(data, id_cols = c(SUBJ, AGE, ARM), names_from = Timepoint, values_from = ID) 
write_xlsx(list(sheet1 = res), path = fname)

mtcars <- data(mtcars)

## gene expression example ----
fname <- "Datasets/transcriptomics_results.csv"
res <- read_csv(fname)
res <- res[ , c(3, 5, 8:9) ]
colnames(res) <- c("Gene", "Description", "LFC", "p.value")

res$p.value < .05, LFC < -1.5) %>% 
  arrange(Gene)


## merging data ----
# read the first sheet from the XLSX file and the CSV file.
fname <- "Datasets/expression_data_vaccination_example.xlsx"
exp.data <- read_excel(fname)
fname <- "Datasets/labresults_full.csv"
meta.data <- read_csv(fname)
# Which columns ID the subjects? Are there any subjects in common? How do you match the subjects?
intersect(colnames(exp.data), colnames(meta.data))
length(intersect(exp.data$USUBJID, meta.data$USUBJID))

intersect(exp.data$USUBJID, meta.data$USUBJID) %>% 
  length() -> res2

res1 <- intersect(exp.data$USUBJID, meta.data$USUBJID)
res2 <- length(res1)

length(union(exp.data$USUBJID, meta.data$USUBJID))
select(exp.data, SUBJ, USUBJID, ID2)
# We are interested only in the following information: Subject ID, ARM (group), Time point, sex, age, test name and the actual measurement. Are the measurements numeric?
exp.data %>% 
  select(USUBJID, ARM, Timepoint, AGE, SEX) -> sel.data

meta.data %>% 
  select(USUBJID, Timepoint, LBTEST, LBORRES) %>% 
  merge(sel.data, by = c("USUBJID")) %>% 
  mutate(LBORRES = ifelse(str_detect(LBORRES, ">"), "INF", LBORRES)) %>% 
  mutate(LB2 = as.numeric(LBORRES))
# Use the subjects to merge the two data frames however you see fit. Note that there are multiple time points per subject and multiple measurements per subject and time point.
