## Recap ----

# pivot_wider (long -> wide) names_from (column names) and values_from (data you want in your columns)
# pivot_longer (wide -> long) cols, names_to (column names) and values_to (data from the table)

# sort / order / arrange (tidyverse)
# subsetting our data -> numerical values 
# in combination with boolean operators
vec <- c(3, 7, 12)
vec > 5
vec < 10
# operators &  and | and ! (not)
vec > 5 & vec < 10
!(vec > 5)

## searching and subsetting ----
# load libraries 
library(tidyverse)
res <- read_csv("Datasets/transcriptomics_results.csv")

View(res)
interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")


sel <- res$GeneName %in% interferon
sum(sel) # how many matches did we find

res[sel, ] # subsetting your data frame

# using tidyverse
filter(res, GeneName %in% interferon) # it's more verbose

vec1 <- c("a", "c", "b", "c") # element wise, are the elements of vec1 **in** vec2
vec2 <- c("x", "c")
vec1 %in% vec2

match(vec2, vec1) # works with index, gives me the position of vector 2 in vector 1
selind <- match(interferon, res$GeneName) # it only returns the first position

# flipping it
match(vec1, vec2) # we get the index of vec2, so we cannot select anything in vec1

res[selind,]

# search for patients with hypertension
# assuming you have a table called "df" with a column named "disease"
filter(df, disease == "hypertension")
# search for patients with hypertension or diabetes
filter(df, disease %in% c("hypertension", "diabetes"))

## not a replacement 
selind <- grep("Interferon", res$Description, ignore.case = T)  # Global Regular Expression Pattern -> index
sel <- grepl("Interferon", res$Description, ignore.case = T) # Global Regular Expression Pattern Logical -> logical vector

res[selind, ]
res[sel, ]

# using tidyverse (same result as with grep(l))
filter(res, str_detect(Description, "[Ii]nterferon"))

## matching data sets ----
# we are using letters as identifiers
set1 <- letters[1:5] # take a subset
set2 <- letters[3:7] 

intersect(set1, set2)
# we are assuming that ID is the same type of identifiers
df1 <- data.frame(ID=sample(letters, 15), value1=rnorm(15))
df2 <- data.frame(ID=sample(letters, 15), value2=rnorm(15))

common <- intersect(df1$ID, df2$ID)

df1[ match(common, df1$ID), ]
df2[ match(common, df2$ID), ] # same identifiers in the same order

## side-note [] accessing element in a vector / dataframe
# [row index, col index]

# simple but error prone
# 1. you have to make that the order is correct
# 2. you have two columns with the same name -> this will be difficult for selecting
cbind(df1[ match(common, df1$ID), ], df2[ match(common, df2$ID), ])

# easier is merge (basic R)
df.inner <- merge(df1, df2) # inner join - data which exist in both data frames
df.left <- merge(df1, df2, all.x = T)  # left join
df.right <- merge(df1, df2, all.y = T) # right join
df.full <- merge(df1, df2, all = T) # full join

# tidyverse - left_join / right_join ....

# finding the column for identifier - merge just looks for the same name
df1 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
                  value=rnorm(4)) # no ... number (eg visit) 
df2 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4), 
                  value=rnorm(4))

merge(df1, df2) # are all three columns identical
merge(df1, df2, by = "ID") # assumption is ID our only key (eg patient)
merge(df1, df2, by = c("ID", "no"))  # we have to tell R which columns are used for merging

# use meta-information to describe data or identifiers
tribble(
  ~ID1_data1, ~ID2_data2,
  "E12", "xzy",
  "E13", "abc"
)
# deleting variables
rm("df.full") 

## visualizing data ----
# ggplot works best with long format

# compare the distribution of petal width across species
# aes ... aesthetics
# geom ... plotting the data
# themes ...layout
library("ggsci")
library("ggpubr") # interesting for later
# R graphics cookbook
ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) + geom_boxplot() +
  geom_jitter(width = .2) + 
  ylab("Petal Width (in mm)") +
  theme_classic() +
  scale_fill_jco()

# lets look at all measurements at once
iris.long <- pivot_longer(iris, -Species)
ggplot(iris.long, aes(x = Species, y = value, fill = Species )) + geom_boxplot() +
  facet_wrap(~name)

ggplot(iris, aes(x = Petal.Length, y = Sepal.Width, shape = Species) ) + 
  geom_point() +
  theme_classic() +
  theme(legend.position = "none")

# combine plots
plot1 <- ggplot(iris, aes(x = Petal.Length, y = Sepal.Width, shape = Species) ) + 
          geom_point() +
          theme_classic() 
plot1

plot2 <- ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) + geom_boxplot() +
  geom_jitter(width = .2) + 
  ylab("Petal Width (in mm)") +
  theme_classic() +
  scale_fill_jco()

library(cowplot)
plot_grid(plot1, plot2, labels = c("A", "B"), rel_widths = c(2, 1))
ggsave("Rplot.pdf")

