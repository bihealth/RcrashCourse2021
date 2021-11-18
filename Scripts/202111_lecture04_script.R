## Day 4 - searching and sort
# sorting a vector

vec <- c(1:20, 15)
sort(vec) # ascending 
sort(vec, decreasing = TRUE) # changes the vector by itself
rev(sort(vec)) # equivalent to line before

vec[order(vec)] # works with the index -> you have to sort yourself
order(c(1, 2, 3, 0))

# sort any text -> alphabetical
samples <- c(letters[c(12, 4, 2)], LETTERS[1:5], 4, 12, 42)
# assessing elements in a vector - the index 1:5
# regular expression "a-e" - this does not! work for vectors
samples
sort(samples)

# sort a dataframe
df <- data.frame(id=paste0("ID", 1:10), val=rnorm(10))
sort(df$val)
df.order <- order(df$val)
order(df) #  does not work -> will change the whole data frame into one long vector
df[order(df$val), ] # operation of selecting rows in a specific order
df[order(abs(df$val), decreasing = T), ]

# sort using tidyverse
library(tidyverse) 
## dplyr is one package in the tidyverse
# any function from dplyr work this way
# three categories of functions
arrange(df, val) # there is no need to use "df$"
arrange(df, -val)
arrange(df, -abs(val))

res <- read.csv("Datasets/transcriptomics_results.csv")
View(res)

# select columns from a data frame
res1 <- res[, c(3, 5, 8:9)] # by index -> beware of issues
names(res)
res2 <- select(res, GeneName, Description, logFC.F.D1, qval.F.D1) # select works on columns
head(res2)

# changing names of a column
names(res2) <- c("Gene", "Description", "LFC", "p.value") # again, beware of ordering of columns
names(res2)[1] <- "Gene"
res2 <- as_tibble(res2)
res2 <- rename(res2, Gene=GeneName, LFC = logFC.F.D1, p.value = qval.F.D1)

summary(res2)
desc.summary <- summary(factor(res2$Description))
head(sort(desc.summary, decreasing = T), n = 10)

# order by the decreasing absolute value logFC
res2 <- arrange(res2, -abs(LFC))
plot(res2$LFC[1:250], type="b")

plot(res2$LFC, -log10(res2$p.value), type = "p", cex = .1, pch = 19)
# find the 100 most significant ones
res2 <- arrange(res2, p.value)
points(res2$LFC[1:100], -log10(res2$p.value[1:100]), col = "red", cex = .1, pch=19)
abline(h = -log10(0.01), col = "blue")

# gray out nonsignificant genes
index.gray <- which(res2$p.value > 0.01)
genes.gray <- res2[index.gray,]
points(genes.gray$LFC, -log10(genes.gray$p.value), col = "gray", cex = .7, pch=19)


filter(res2, p.value > 0.01) # works on rows
arrange(res2, Gene)

## search for genes in interferon - signaling 
interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")

# using a boolean relation
sel <- res2$Gene %in% interferon
res2[sel, ]

filter(res2, Gene %in% interferon) # equivalent

# use indices - but only the first one
matches <- match(interferon, res2$Gene)
res2[matches, ]

# use pattern
ind.interferon <- grep("Interferon", res2$Description, ignore.case = T) # index
grepl("Interferon", res2$Description, ignore.case = T)

res2[ind.interferon, ]

sel <- grep("^GBP[1-3]$", res2$Gene)
View(res2[sel,])

# search cytokines or chemokines
chemcyt <- filter(res2, grepl("(cytokine|chemokine)", Description))   # filter requires a logical vector
dim(chemcyt)

# using fancy regular expression  - or later you can use tidyverse (separate)
#a <- c("ID-1-2020", "ID-3-2019", "ABC-4-2018")
#gsub(".*-(.*)-.*", "\\1", a)

sum(grepl("(Other|Unknown)", res2$Description, ignore.case = T))

# matching data sets

set1 <- letters[1:5]
set2 <- letters[3:7]

intersect(set1, set2)

df1 <- data.frame(ID=sample(letters, 15), value1=rnorm(15))
df2 <- data.frame(ID=sample(letters, 15), value2=rnorm(15))

common <- intersect(df1$ID, df2$ID)

# subset our dataframes
sub.df1 <- df1[match(common, df1$ID),]
sub.df2 <- df2[match(common, df2$ID),]

#filter(df2, ID %in% common) - warning!
cbind(sub.df1, sub.df2)
cbind(sub.df1, filter(df2, ID %in% common)) # !! the order is different and the combined data is not matching

# using function from dplyr similar to data base
inner_join(df1, df2, by = "ID")
df1$comment <- "comment"
df2$comment <- 2
left_join(df1, df2, by = "ID") # join is guessing which columns to use
full_join(df1, df2, by = "ID")

# using base R
merge(df1, df2, by = "ID")

# what if your ID columns are not named the same
# -> use help to add parameters

# having multiples files 
fnames <- list.files("Datasets/", pattern = ".*csv", full.names = T)
names(fnames) <- fnames

result <- lapply(fnames, read_csv)

bind_rows(result, .id = "file_index")

library(readxl)
expr <- read_excel("Datasets/expression_data_vaccination_example.xlsx")
lab <- read_csv("Datasets/labresults_full.csv")

data <- inner_join(expr, lab, by=c("USUBJID", "Timepoint"))
View(data)
data <- data[, c("USUBJID", "ARM", "SEX", "AGE", "Timepoint", "LBTEST", "LBORRES")]

expr <- select(expr, USUBJID, Timepoint, AGE, SEX)
lab <- select(lab, USUBJID, Timepoint, LBTEST, LBORRES)
inner_join(expr, lab)

library(colorDF)
summary_colorDF(data)
