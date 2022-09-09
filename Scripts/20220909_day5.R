# iris data set of R A Fisher

iris

pca <- prcomp(iris[ , -5 ], scale. = TRUE)
pca$x
dim(pca$x)

# calculate the variance fraction of the individual components
pcvars <- pca$sdev^2
pcvars_frac <- pcvars / sum(pcvars)
sum(pcvars_frac)
pcvars_perc <- round(pcvars_frac * 100, digits = 0)

# let us make "dynamic" labels
xlabel <- paste("PC1", pcvars_perc[1], "%")

# library glue: userfriendly
library(glue)
xlabel <- glue("PC1 ({pcvars_perc[1]}%)")
ylabel <- glue("PC2 ({pcvars_perc[2]}%)")


colors <- iris$Species
colors <- gsub("virginica", "navyblue", colors)
colors <- gsub("versicolor", "darkred", colors)
colors <- gsub("setosa", "darkgreen", colors)
colors

# base R graphics
plot(pca$x[ , 1], pca$x[ , 2], col=colors, pch=19, bty="n", xlab = xlabel, 
     ylab = ylabel, main="Principal component analysis\nof the iris data set")
legend("topright", legend = c("I. versicolor", "I. setosa", "I. virginica"),
       pch = 19, col = c("darkred", "darkgreen", "navyblue"), bty="n")

# ggplot2 graphics
library(tidyverse)
df <- as.data.frame(pca$x)
df$Species <- iris$Species
theme_set(theme_minimal())
ggplot(df, aes(x = PC1, y = PC2, color = Species)) + geom_point() +
  scale_color_brewer(palette = "Dark2") + 
  ggtitle("Principal component analysis\nof the iris data set") + 
  theme(legend.position = "bottom") +
  xlab(xlabel) +
  ylab(ylabel)

# variance of the first component
var(df$PC1)
var(df$PC2)

# scree plot (variance by component)

df <- data.frame(VAR=pcvars_frac, PC=1:4)
ggplot(df, aes(x = PC, y = VAR)) + 
  geom_point() + geom_line()


# here we want nicer labels on the x axis
df <- data.frame(VAR=pcvars_frac, PC=1:4)
df$PC <- paste("PC", df$PC)

## not very intuitive: we need to specify a group aesthetics such that 
## ggplot knows all observations are from the same group
ggplot(df, aes(x = PC, y = VAR, group = "foo")) + 
  geom_point() + geom_line()

## here is where it makes sense for ggplot to take groups from the x
## aesthetics

ggplot(iris, aes(x = Species, y = Sepal.Width)) + geom_boxplot()



## show R color brewer palettes
library(RColorBrewer)
display.brewer.all(colorblindFriendly = TRUE)

# mean
mean(iris$Sepal.Length)

# median
median(iris$Sepal.Length)

# standard deviation
sd(iris$Sepal.Length)

# scaling sepal length
sl_sc <- (iris$Sepal.Length - mean(iris$Sepal.Length)) / sd(iris$Sepal.Length)
sl_sc
plot(iris$Sepal.Length, sl_sc)
mean(sl_sc)
sd(sl_sc)
