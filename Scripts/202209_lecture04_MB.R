# type of data frames (wide vs long) ----
# wide format - one line = one sample
iris
plot(iris$Sepal.Length, iris$Sepal.Width, col=as.factor(iris$Species))

library(tidyverse) # tidyverse usually does not use quotes around column names
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) + 
  geom_point()

ggplot(iris, aes(x = Sepal.Length, fill = Species)) + geom_histogram()

# long format 
iris$id <- 1:nrow(iris)
head(iris)
tail(iris)
iris.long <- pivot_longer(iris, 
                c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))
head(iris.long)

ggplot(iris.long, aes(x = value, fill = Species)) + geom_histogram() +
  facet_wrap(~name) +       # facet_grid (patient ~ treatment)
  theme_minimal() + 
  theme(legend.position = "bottom")

# ~ tilde on Mac: Alt n
# additional packages: ggpubr / cowplot / ggsci

dim(iris)
dim(iris.long)

pivot_wider(iris.long, names_from = name, values_from = value)

## side information ----
# removing data
iris <- read_csv("Datasets/iris.csv")
rm(iris)

# tidying column names
library(janitor)
irisBotched <- read_csv("Datasets/iris.csv")
clean_names(irisBotched)


# sorting and selecting data ----
rndNmbrs <- sample(1:10)/10 
sort(rndNmbrs) # ascending
sort(rndNmbrs, decreasing = TRUE)
rev(sort(rndNmbrs)) # equivalent to line 47

rev(c("mon", "tue", "weekend"))

ordRnd <- order(rndNmbrs)
rndNmbrs[ordRnd]

rndLetters <- sample(letters[1:10])
sort(rndLetters)
# sort rndLetters by measurements (rndNmbrs)
rndLetters[ordRnd]

v <- sample(1:200, 15)
vch <- as.character(v)
sort(vch) # expected: 1, 2, 3,  -> that's not how it works on characters

# working on data frames
df <- data.frame(id=paste0("ID", 1:10), val=rnorm(10))
ord <- order(df$val)
df[ord, ]
df[rev(ord), ]

ord2 <- order(abs(df$val))
df[ord2, ]

arrange(df, val)
arrange(df, desc(val))

df$group <- rep(c("A", "B"), each = 5)
df

arrange(df, val)
arrange(df, group, val)




# starting with a bigger example ----
data <- read_csv("Datasets/transcriptomics_results.csv")
head(data)
View(data)
# keep Gene name, log2FC on Day, p-value

data[, c(3, 5, 8, 9)]
data[, c("GeneName", "Description", "logFC.F.D1", "qval.F.D1")]
df <- select(data, GeneName, Description, logFC.F.D1, qval.F.D1) # tidyverse way

library(colorDF)
summary_colorDF(df)

names(df) <- c("Gene", "Description", "LFC", "p.value")

desc.sum <- summary(factor(df$Gene)) # be careful, summary only works for a certain number of elements
arrange(count(df, Gene), desc(n))
head(sort(desc.sum, decreasing = T))

ord <- order(abs(df$LFC), decreasing = T)
df <- df[ord, ]
plot(df$LFC[1:300], type = "b")

ord <- order(df$p.value)
df <- df[ord, ]
plot(df$p.value)
abline(h = 0.05, col= "red")
plot(df$p.value[1:300], type = "b", log = "y")
plot(df$LFC[1:300], type = "b")

lo <- loess.smooth(1:300, abs(df$LFC[1:300]))
lo
plot(df$LFC[1:300], type = "b", col="grey", bty="n", ylab = "Log2 Fold Change")
lines(lo$x, lo$y)

# filtering data ----
keep <- df$p.value < 0.05
sum(keep) # TRUE = 1, FALSE = 0
df[keep, ]
##
filter(df, p.value < 0.05)







# searching / subsetting ----
# works on characters
interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")

selGene <- df$Gene %in% interferon
df[selGene, ]

arrange(filter(df, Gene %in% interferon), Gene)

int <- grep("Interferon", df$Description)
int <- grep("Interferon", df$Description, ignore.case = TRUE)
df[int, ]

intLog <- grepl("Interferon", df$Description, ignore.case = TRUE)

# Search for GBP1 , GBP2, GBP3
sel <- grep("^GBP[123]$", df$Gene)
df[sel, ]

# search for cytokine or chemokine
sel <- grep("cytokine|chemokine", df$Description, ignore.case = TRUE)
df[sel,]

sel <- df$Gene %in% interferon
significant <- df$p.value < 0.05 & abs(df$LFC) > 1.5
sel <- sel & significant

df[sel, ]

filter(df, p.value < 0.05 & abs(LFC) > 1.5 & Gene %in% interferon)



