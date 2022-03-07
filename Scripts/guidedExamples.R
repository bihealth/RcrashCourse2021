## load libraries ----
library(tidyverse)
library(readxl)
library(colorDF) # for summary_colorDF
library(writexl)

## load data ----
elec.data <- read_excel("Datasets/ElectrolytesExamples.xlsx")

## inspect and clean data ----
summary_colorDF(elec.data)
summary_colorDF(iris, numformat = "graphics")

# what is the min and max for each measurement and patient 
# summarizing data by groups
summary(elec.data)
elec.data <- group_by(elec.data, Labormethode, Fallnummer)
# use summarize from tidyverse
summarise(elec.data, min = min(Wert), 
          max = max(Wert), 
          median = median(Wert),
          q25 = quantile(Wert, .25),
          q75 = quantile(Wert, .75),
          nrMeasurement = n())

write_xlsx(sum.data, "testSummary.xlsx")

# comparing groups using a t-test
??"t-test"
df <- data.frame(x = rnorm(100), y = rnorm(100, mean = 5))
t.test(df$x, df$y)

# use pivot_wider (if you have the same number of measurements for each group)
pivot_wider(elec.data, names_from = "Labormethode", values_from = "Wert")
# use nesting 

