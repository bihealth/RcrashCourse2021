c(5, 10)

library(readxl)
mdb <- read_excel("Datasets/meta_data_botched.xlsx")
mdb$AGE
mdb

foo <- read_csv("Datasets/iris.csv")
summary(mdb)

class(mdb$AGE)
typeof(mdb$AGE)

class(foo)

class(foo$Petal.Width)
typeof(foo$Petal.Width)

install.packages("colorDF")
library(colorDF)

## produce a table summarizing information for every column of the foo data frame
summary_colorDF(foo)

# get all unique values
unique(mdb$SEX)

## apply unique() to every column 
lapply(mdb, unique)

summary_colorDF(foo)

group <- c("Control", " control", "control ", "Control   ")
group <- gsub("Control", "control", group)
group <- gsub(" ", "", group)
group
unique(group)

mdb$AGE

tmp <- gsub(" ", "", mdb$AGE)
gsub("\\(notsureifthatoneiscorrect\\)", "", tmp)

group <- c("Control", " control", "control ", "Control   ", "group 1")
gsub(" ", "", group)
gsub(" $", "", group)
gsub(" *$", "", group)
gsub("^ *", "", group)

group <- c("kakaka", "kukuku", "babambammmmm", "bambengbam")
gsub("bam*", "X", group)
gsub("bam+", "X", group)
gsub("bam?", "X", group)

mdb <- read_excel("Datasets/meta_data_botched.xlsx")

mdb$SEX
mdb$SEX <- gsub("male", "M", mdb$SEX, ignore.case = TRUE)
#mdb$SEX <- gsub("MALE", "M", mdb$SEX)
mdb$SEX <- gsub("woa*man", "F", mdb$SEX)

mdb$SEX <- gsub("woa*man", "F", gsub("male", "M", mdb$SEX, ignore.case = TRUE))

gsub("a", "x", "aAaAaA", ignore.case=TRUE)


mdb$AGE

gsub("[a-z ()]*", "", mdb$AGE)

sub("[a-z]", "X", "Rcrashcourse" )

gsub("[shecra]+", "X", "Rcrashcourse" )

gsub("\\.", "", "2.5")

fname <- "botched_data_2022_03_02.xlsx"
gsub("botched_data_.*xlsx", "botched_data", fname)


data <- c("25", "51+", "19")
gsub("\\+", "", data)


gsub("[^0-9]+", "X", "2.5sdfasdfasd")



gsub(".*-", "", mdb$USUBJID)


"CRC305C-9078-1321"

tmp <- gsub("-[^-]*$", "", mdb$USUBJID)
gsub(".*-", "", tmp)

genes <- c("ankrd22", "ifng", "Nf-kb", " Cxcl 5", "CCL 6.", "ANK.r.d. 12")
genes <- toupper(genes)
genes <- gsub("[^a-zA-Z0-9]", "", genes)
genes

anks <- c("ANKRD22", "BANK", "ANKYLIN", "ank.rep.domain 12", "ifng-1", "ANKRD-33", "  ankrd23")

foo <- grep("^ *ank.*r.*d.*[0-9]+$", anks, ignore.case = T)
length(foo)
fool <- grepl("^ *ank.*r.*d.*[0-9]+$", anks, ignore.case = T)
sum(fool)
sum(c(5, 7, 8))
grep("interferon", genes)




labdat <- read_csv("Datasets/labresults_full.csv")
labwide <- read_csv("Datasets/labresults_wide.csv")
labdat[ grep("RDW", labdat$LBTESTCD), ]


wide <- read.table(header=TRUE, text='
 subject sex control cond1 cond2
       1   M     7.9  12.3  10.7
       2   F     6.3  10.6  11.1
       3   F     9.5  13.1  13.8
       4   M    11.5  13.4  12.9
')
wide

library(tidyverse)
longer <- pivot_longer(wide, cols=c("control", "cond1", "cond2"), names_to = "Condition", values_to = "Measurement")

wider <- pivot_wider(longer, names_from="Condition", values_from="Measurement")

long <- read.table(header=TRUE, text='
 subject  sampleID sex condition measurement
       1  ID000001 M   control         7.9
       1  ID000002 M     cond1        12.3
       1  ID000003 M     cond2        10.7
       2  ID000004 F   control         6.3
       2  ID000005 F     cond1        10.6
       2  ID000006 F     cond2        11.1
       3  ID000007 F   control         9.5
       3  ID000008 F     cond1        13.1
       3  ID000009 F     cond2        13.8
')

## !!!wrong
pivot_wider(long, names_from="condition", values_from="measurement")

## correct
pivot_wider(long, id_cols="subject", names_from="condition", values_from="measurement")

length(unique(long$subject))
