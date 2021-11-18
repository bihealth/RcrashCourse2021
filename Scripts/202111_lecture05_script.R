# working with the lab results
# load libraries ----
library(tidyverse)
library(colorDF)
library(broom)
library(beeswarm)
library(cowplot)

# load data ----
labData <- read_csv("Datasets/labresults_wide_full.csv")
# clean data ----
summary_colorDF(labData)
# finished !

# descriptive statistics ----
mean(labData$NEUT)
sd(labData$NEUT)
summary(labData)
# calculate means for different arm
# using apply-functions (rather than using loops)
mean.arms <- tapply(labData$NEUT, labData$ARM, mean)
# same as (but only in printing) 
arms <- unique(labData$ARM)
for(i in arms){
  print(i)
  smallData <- filter(labData, ARM == i)
  print(mean(smallData$NEUT))
}

mean.time <- tapply(labData$NEUT, labData$Timepoint, mean)
# compare means for arms and timepoints at the same time
combinedGroup <- paste(labData$ARM, labData$Timepoint, sep = ".")
tapply(labData$NEUT, combinedGroup, mean)

# use tidyverse 
labData.tidy <- unite(labData, combinedGroup, ARM, Timepoint, sep = ".", remove = F)
tapply(labData.tidy$NEUT, labData.tidy$combinedGroup, mean)

# comparative statistics of different time-points ----
# use a t-test
# insert our vectors of interest (based on groups)
d0 <- labData$Timepoint == "D0"
d1 <- labData$Timepoint == "D1"

fluad <- labData$ARM == "FLUAD"
aggripal <- labData$ARM == "AGRIPPAL"
# we are interested in the lymphocyte count
x <- labData$LYM

t.test(x[d0 & fluad], x[d1 & fluad])
## possible issues
# multiple testing of different time-points and measurements
# paired information
pairedFluad <- t.test(x[d0 & fluad], x[d1 & fluad], paired = T)
tidy(wilcox.test(x[d0 & fluad], x[d1 & fluad], paired = T))
tidy(pairedFluad)

# comparison for NEUT, LYM, CRP for the two ARMS FLUAD and AGRIPPAL
x <- labData$NEUT
pairedFluad <- t.test(x[d0 & fluad], x[d1 & fluad], paired = T)
pairedAggripal <- t.test(x[d0 & aggripal], x[d1 & aggripal], paired = T)
testResult <- bind_rows(tidy(pairedFluad), tidy(pairedAggripal))

x <- labData$LYM
pairedFluad <- t.test(x[d0 & fluad], x[d1 & fluad], paired = T)
pairedAggripal <- t.test(x[d0 & aggripal], x[d1 & aggripal], paired = T)


rbind(tidy(pairedFluad), tidy(pairedAggripal))

# visualize data ----
# visualize data to explore relationships between neutrophils and time-points 
labData$armcd <- gsub("(.).*", "\\1", labData$ARM)
labData$group <- paste(labData$armcd, labData$Timepoint, sep = ".")

boxplot(NEUT ~ group, data = labData)
beeswarm(NEUT ~ group, data = labData)
boxplot(NEUT ~ group, data = labData, add = T, col = NA)

# tidyverse - ggplot (always works on data frames)
plot1 <- ggplot(labData, aes(x = group, y = NEUT)) + geom_boxplot() +
  geom_jitter(width = .2)

plot1 + geom_hline(yintercept = 20, col = "darkred")

# compare d0 with d1 and highlight the different arms of the study
plot1 <- ggplot(labData, aes(x = Timepoint, y = NEUT, color = ARM, group = USUBJID)) + geom_point(size =2 ) +
  geom_line() + facet_grid(. ~ ARM) +
  xlab("Day") + 
  ylab("Neutrophiles") +
  theme_bw() + 
  ggtitle("Change in neutrophile count in different study arms") +
  theme(legend.position = "none")
ggsave("plotNeutrophiles.pdf", plot = plot1)

# explorative data analysis ----
# PCA, ICA, mca, clustering
# interlude on the iris data set
head(iris)
data(iris)
res <- prcomp(iris[, 1:4], scale. = TRUE)
df <- data.frame(res$x, species=iris$Species)
plot(res)

# d1 and fluad or placebo
labData
placebo <- labData$ARM == "PLACEBO" # same as grepl("Placebo", labData$ARM, ignore.cases = TRUE)

sel <- (d1 & fluad) | (d1 & placebo)

lab_mtx <- select(labData[sel, ], ACA:WBC) # use tidyverse option to select our data
resLab <- prcomp(lab_mtx, scale. = TRUE)
dfLab <- data.frame(resLab$x, arm = labData[sel,]$ARM)
ggplot(dfLab, aes(x = PC1, y = PC2, color = arm)) + geom_point(size = 2)
plot(resLab)

resLoading <- rownames_to_column(as.data.frame(resLab$rotation), var = "measurement")
# sort for the measurements with highest impact
head(arrange(resLoading, -abs(PC2)))


# fix a theme
theme_set(theme_bw())
p1 <- ggplot(df, aes(x = PC1, y = PC2, color = species)) + geom_point() + theme(legend.position = "none")
p2 <- ggplot(df, aes(x = PC3, y = PC4, color = species)) + geom_point()


plot_grid(p1, p2, rel_widths = c(.4, .6))
ggsave("combinedPlot.pdf")

# linear model for our data ----