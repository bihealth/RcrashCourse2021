library(tidyverse)
library(readxl)
library(colorDF)

# read in cars.xlsx
cars <- read_excel("data/cars.xlsx", sheet = "Sheet1")
summary(cars)
excel_sheets("data/cars.xlsx")

# read in iris.csv
iris <- read_csv("data/iris.csv")
iris$Petal?Length
iris <- rename(iris, Petal.Length = `Petal?Length`)
summary(iris)
summary_colorDF(iris)
View(iris)

# read in expression_data_vaccination_example
expr <- read_excel("data/expression_data_vaccination_example.xlsx")


# lets read in multiple files from one directory
fnames <- list.files("data", pattern = ".xlsx", full.names = TRUE)
names(fnames) <- list.files("data", pattern = ".xlsx")

res <- lapply(fnames, read_excel)
res[["long_vs_wide_format.xlsx"]]
View(bind_rows(res[1:2], .id = "file_name"))

