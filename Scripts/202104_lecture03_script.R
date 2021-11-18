library(tidyverse)
library(readxl)
library(colorDF)

# read in expression_data_vaccination_example
expr <- read_excel("data/expression_data_vaccination_example.xlsx")
botched <- read_excel("data/meta_data_botched.xlsx")
summary_colorDF(botched)

# substitutions ----
group <- c("Control", " control", "control ", "Control  ", "dC", "first treatment")
# delete spaces
group <- gsub(pattern = " ", replacement = "", group)
# capital letters to lower (independent of position)
gsub(pattern = "C", replacement = "c", group)
tolower(group)

# take first letter
gsub(pattern = "^C", "c", group)
# remove only spaces in the beginning
group <- gsub("^ ", "", group)
gsub(" *$", "", group) # any number of white space

# regular expressions part 2 ----
foo <- c("a1_123", "a1_231", "a2_17", "B2_23", "c2_889")
gsub("[0-9]*", "", foo)
gsub("[a-z]*", "", tolower(foo))
gsub("[a-zA-Z]*", "", foo)
gsub("[a-z]", "", foo, ignore.case = T)

gsub("_.*", "", foo)

vec <- c("mouse", " Mouse", "mus domesticus", "chicken", "Schicken", "Duck")
vec <- gsub("S*chicken", "Chicken", gsub("^m.*", "Mouse", gsub("^ *", "", vec)))

# exercise 3.1 ----
genes <- c("ANKRD22", "ank.rep.domain 12", "ifng-1", "ANKRD-33", "  ankrd23")
genes <- tolower(trimws(genes))
genes <- gsub("\\..*", "rd", genes)
genes <- gsub("[0-9\\-]", "", genes)

gene_names <- c("ankrd22", "ifng", "Nf-kb", " Cxcl 5", "CCL 6.", "ANK.r.d. 12")
# remove . - " " 
hgnc <- trimws(gene_names)
# make everything to upper case
hgnc <- toupper(hgnc)
hgnc <- gsub(" ", "", hgnc)
hgnc <- gsub("[\\.\\-]", "", hgnc)

# clean botched data ----
botched <- read_excel("data/meta_data_botched.xlsx")
summary(botched$AGE) 

botched$AGE[which(is.na(as.numeric(botched$AGE)))]
botched$AGE <- gsub("[^0-9]", replacement = "", botched$AGE)
botched$AGE <- as.numeric(botched$AGE)

library(writexl)
# work with data ----
# summary(botched)
# class()
# factor(botched$SEX)
# summary_colorDF(botched)
# look at range of data
# certain elements should appear only once (sample_id)

iris %>% 
  pivot_longer(cols = -c(X1, Species), names_to = "measure", values_to = "value") %>% 
  mutate(measure = str_replace(measure, " ", ".")) %>% 
  ggplot(aes(x = measure, y = value, fill = Species)) + geom_violin() +
  facet_wrap(~Species)

iris_long <- pivot_longer(iris,cols = -c(X1, Species), names_to = "measure", values_to = "value")
iris_long$measure <- gsub(" ", ".", iris_long$measure)
iris_long$Species <- tolower(iris_long$Species)
ggplot(iris_long, aes(x = measure, y = value, fill = Species)) + geom_violin()

ggplot(iris, aes(x = `Sepal Width`, y = `Sepal Length`, color = Species)) + geom_point()

result <- prcomp(as.matrix(iris[, 2:5]))
ggplot(as.data.frame(result$x), aes(x = PC1, y = PC2)) + geom_point()

wide <- read.table(header=TRUE, text='
 subject sex control cond1 cond2
       1   M     7.9  12.3  10.7
       2   F     6.3  10.6  11.1
       3   F     9.5  13.1  13.8
       4   M    11.5  13.4  12.9
')
pivot_longer(wide, cols=c("control", "cond1", "cond2"), 
             names_to="condition", values_to="measurement")


pivot_wider(iris_long, names_from = "measure", values_from = "value")

cars <- read_csv("data/mtcars_wide.csv")
cars$mpg <- as.numeric(cars$mpg)
cars_wide <- mutate(cars,
       mpg = gsub("[^0-9]", "", mpg),              
       mpg = as.numeric(mpg),
       vs = as.numeric(vs))

pivot_longer(cars_wide, mpg:carb, names_to = "measure", values_to = "value")

cars_wide <- read_excel("data/cars.xlsx")
cars_wide$car_id = 1:nrow(cars_wide)

# searching and sorting ----


v <- sample(1:200, 15)
sort(as.character(v))
df <- data.frame(id=paste0("ID", 1:10), val=rnorm(10))
sort(df$val)
order(df$val)
arrange(df, val)  # equivalent to df[order(df$val), ]
arrange(df, -abs(val))

res  <- read_csv("data/transcriptomics_results.csv")
tbl.res <- as_data_frame(read.csv("data/transcriptomics_results.csv"))
# select means on columns (on the type of data)
res1 <- res[ , c(3, 5, 8:9) ]
colnames(res1) <- c("Gene", "Description", "LFC", "p.value") 

res2 <- select(res, Description, logFC.F.D1, qval.F.D1, GeneName)
res2 <- rename(res2,
               Gene = GeneName,
               LFC = logFC.F.D1,
               p.value = qval.F.D1)

res2[order(abs(res2$LFC)), ]
arrange(res2, -abs(LFC))

# filter means on rows (on values)
keep <- res2$p.value < 0.05
res2[keep, ]

interestingGenes <- filter(res2, p.value < 0.05 & abs(LFC) > 1.5) # & and operator | or
nrow(interestingGenes)


interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")

sel <- interestingGenes$Gene %in% interferon
interestingGenes[sel, ]
filter(interestingGenes, Gene %in% interferon)

match(interferon, interestingGenes$Gene)

# regular expressions part 2 ----
int_index <- grep("Interferon", interestingGenes$Description, ignore.case = TRUE)
int_log <- grepl("Interferon", interestingGenes$Description, ignore.case = TRUE)
interestingGenes[int_index,]
gbp_ind <- grep("^GBP[1-9]$", interestingGenes$Gene)
interestingGenes[gbp_ind,]

filter(interestingGenes, str_detect(Gene, pattern = "^GBP[1-9]$"))

head(int_log, 10) | head(sel, 10)

