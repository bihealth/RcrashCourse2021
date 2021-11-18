##------ Thu Mar  4 13:52:30 2021 ------##
mtcars <- read_csv("../Datasets/mtcars_wide.csv")
mtcars$mpg
as.numeric(gsub("[^0-9]", "", mtcars$mpg))
data(mtcars)
mtcars
rownames_to_column(mtcars, "Model")
mtcars <- rownames_to_column(mtcars, "Model")
mtcars
pivot_longer(mtcars, cols=)#
coln <- colnames(mtcars)
coln
coln[-1]
pivot_longer(mtcars, cols=colnames(mtcars)[-1], names_to="parameter", values_to = "value")
pivot_longer(mtcars, cols=c(mpg:cyl, drat:vs), names_to="parameter", values_to = "value")
lb <- read_csv("../Datasets/labresults_wide.csv")
lb
colnames(lb)
lb$LBORRES.GFR
lb
lb[ , -10 ]
lb <- lb[ , -10 ]
pivot_longer(lb, cols=-1, names_to="param", values_to="val")
lb[ , -10 ]
lb <- read_csv("../Datasets/labresults_wide.csv")
lb
lb$LBORRES.GFR
unique(lb$LBORRES.GFR)
lb[ , -10 ]
lb <- lb[ , -10 ]
pivot_longer(lb, cols=-1, names_to="param", values_to="val")
lb <- read_csv("../Datasets/labresults_full.csv")
lb
lb$LBCAT <- NULL
lb
v <- sample(1:10)/10 # randomize numbers 1-10
sort(v)
1:10
sample(1:10)
sample(1:10)
sample(1:10)
sample(1:10)
sample(1:10)
sample(1:10)/10
sort(sample(1:10)/10)
sort(sample(1:10)/10, decreasing = TRUE)
rev(sort(sample(1:10)/10))
v
v <- sample(1:10)
v
v
v[1]
v[10]
v[6]
order(v)
new_order <- order(v)
v[ 1 ]
v[ 10 ]
v[ 3 ]
v[ 6 ]
v[ c(1, 10, 3) ]
v[ c(1, 10, 6) ]
v
new_order <- order(v)
new_order
v[ new_order ]
v/10
v <- v/10
v
v[ c(1, 10, 6)]
v[ new_order ]
identical(v[ new_order ], sort(v))
v <- sample(1:200, 15)
v
v <- as.character(v)
v
sort(v)
patid <- c("Pat1", "Pat3", "Pat123")
sort(patid)
patid <- c("Pat001", "Pat003", "Pat123")
sort(patid)
fact <- factor(c("P99", "P01", "P20"), levels=c("P99", "P01", "P20"))
sort(fact)
fact <- factor(c("P99", "P01", "P20", "P01", "P99", "P99"), levels=c("P99", "P01", "P20"))
fact
sort(fact)
fact
as.integer(fact)
fact <- factor(c("99", "1", "20", "1", "99", "99"), levels=c("99", "1", "20"))
fact
fact[1]
fact[1] < fact[2]
as.integer(fact[1]) < as.integer(fact[2])
sort(c("P.1", "A.2"))
sort(c("P.1", "P.2"))
sort(c("P.1", "P.3", "P.2"))
df <- data.frame(id=paste0("ID", 1:10), val=rnorm(10))
View(df)
nord <- order(df$val)
nord
df$val[ nord ]
nord <- order(df$val, decreasing = TRUE)
nord <- order(-df$val)
nord <- order(df$val, decreasing = TRUE)
df$val[ nord ]
df[ nord, ]
arrange(df, val)
val
arrange(df, -val)
arrange(df, -abs(val))
order(df$val)
df$val[ order(df$val)]
sort(df$val)
df
arrange(df, abs(val))
arrange(df, desc(abs(val)))
res <- read.csv("../Datasets/transcriptomics_results.csv")
res
View(res)
res <- res[ , c(3, 5, 8:9) ]
colnames(res) <- c("Gene", "Description", "LFC", "p.value")
res
ord <- order(abs(res$LFC), decreasing=TRUE)
head(res[ord, ])
res <- res[ord, ]
plot(res$LFC[1:250], type="b")
plot(abs(res$LFC[1:250]), type="b")
plot(res$p.value[1:250], type="b", log="y")
lo <- loess.smooth(1:500, abs(res$LFC[1:500]))
plot(abs(res$LFC[1:500]), col="grey", type="b", bty="n",
ylab="Log2 fold change")
lines(lo$x, lo$y)
lo <- loess.smooth(1:500, abs(res$LFC[1:500]), evaluation = 10)
plot(abs(res$LFC[1:500]), col="grey", type="b", bty="n",
ylab="Log2 fold change")
lines(lo$x, lo$y)
res <- res[order(res$p.value), ]
lo <- loess.smooth(1:500, abs(res$LFC[1:500]), evaluation = 10)
plot(abs(res$LFC[1:500]), col="grey", type="b", bty="n",
ylab="Log2 fold change")
lines(lo$x, lo$y)
res$p.value < 0.05
res_sign <- res[keep, ]
keep <- res$p.value < 0.05
res_sign <- res[keep, ]
View(res_sign)
res <- read_csv("../Datasets/transcriptomics_results.csv")
res
class(res)
res <- res[ , c(3, 5, 8:9) ]
colnames(res) <- c("Gene", "Description", "LFC", "p.value")
res <- res[ order(res$Gene), ]
res
arrange(res, LFC)
arrange(res, desc(LFC))
arrange(res, desc(p.value))
arrange(res, p.value)
keep <- res$p.value < 0.05
res[ keep, ]
res_filtered <- res[ keep, ]
keep <- abs(res_filtered$LFC) > 1.5
res_filterd < res_filtered[keep, ]
res_filtered < res_filtered[keep, ]
res_filtered <- res_filtered[keep, ]
res_filtered
keep <- res_filtered$LFC < 0
sum(keep)
res_filtered[keep, ]
arrange(res, Gene)
c(1, 5, 7) %in% 5:15
res
res <- res[ order(res$p.value), ]
res
res
interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
"IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")
res[ res$Gene %in% interferon, ]
library(tmod)
data(tmod)
tmod$MODULES2GENES$LI.M4.0
res[ res$Gene %in% tmod$MODULES2GENES$LI.M102, ]
match(c(1, 9, 5), sample(10))
v <- sample(10)
v
match(c(1, 9, 5), v)
match(interferon, res$Gene)
interferon
interferon <- c(interferon, "FCGR1B")
res[ res$Gene %in% tmod$MODULES2GENES$LI.M102, ]
res[ res$Gene %in% interferon, ]
res[ match(interferon, res$Gene), ]
int <- grep("Interferon", res$Description, ignore.case=TRUE)
int
res[int, ]
sel <- grep("^GBP[123]$", res$Gene)
res[ sel, ]
sel <- grep("^GBP[0-9]+$", res$Gene)
res[ sel, ]
vec1 <- c(TRUE, TRUE, FALSE)
vec2 <- C(TRUE, FALSE, FALSE)
vec2 <- c(TRUE, FALSE, FALSE)
vec1
vec2
vec1 | vec2
vec1 & vec2
res
res[ abs(res$LFC) > 2 & p.value < 0.05, ]
res[ abs(res$LFC) > 2 & res$p.value < 0.05, ]
filter(abs(LFC) > 2, p.value < 0.05)
filter(res, abs(LFC) > 2, p.value < 0.05)
filter(res, abs(LFC) > 2 | p.value < 0.05)
filter(res, abs(LFC) > 2 & p.value < 0.05)
wtih(res, res[ abs(LFC) > 2 & p.value < 0.05, ])
with(res, res[ abs(LFC) > 2 & p.value < 0.05, ])
set1 <- letters[1:5]
set2 <- letters[3:7]
set1
set2
intersect(set1, set2)
setdiff(set2, set1)
union(set1, set2)
df1 <- data.frame(ID=sample(letters, 15), value1=rnorm(15))
df2 <- data.frame(ID=sample(letters, 15), value2=rnorm(15))
df1
df2
intersect(df1$ID, df2$ID)
common <- intersect(df1$ID, df2$ID)
df1[ match(common, df1$ID), ]
df2[ match(common, df2$ID), ]
df1_matched <- df1[ match(common, df1$ID), ]
df2_matched <- df2[ match(common, df2$ID), ]
df1_matched$ID == df2_matched$ID
all(df1_matched$ID == df2_matched$ID)
cbind(df1_matched, df2_matched)
merge(df1, df2)
merge(df1, df2, all=TRUE)
merge(df1, df2, all.x=TRUE)
merge(df1, df2, all.y=TRUE)
mm <- merge(df1, df2, all.y=TRUE)
mm[ order( (is.na(mm$value1) | is.na(mm$value2))), ]
mm <- merge(df1, df2, all=TRUE)
mm[ order( (is.na(mm$value1) | is.na(mm$value2))), ]
is.na(mm$value1) | is.na(mm$value2)
mm
mm[ order( (is.na(mm$value1) | is.na(mm$value2))), ]
mm[ order( (2 * is.na(mm$value1) + is.na(mm$value2))), ]
2 * is.na(mm$value1) + is.na(mm$value2)
df1 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4),
value=rnorm(4))
df2 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 3, 4),
value=rnorm(4))
df1
df2
merge(df1, df2)
merge(df1, df2, by="ID")
merge(df1, df2, by=c("ID", "no"))
df2$SubjectID=df2$ID
df1 <- data.frame(PatientID=c("a", "y", "b", "c"),
value=rnorm(4))
df2 <- data.frame(SubjectID=c("a", "x", "b", "c"),
value=rnorm(4))
df1
df2
merge(df1, df2)
merge(df1, df2, by.x="PatientID", by.y="SubjectID")
df1 <- data.frame(PatientID=c("a", "z", "b", "c"),
value=rnorm(4))
df2 <- data.frame(SubjectID=c("a", "v", "b", "c"),
value=rnorm(4))
df1
df2
merge(df1, df2, by.x="PatientID", by.y="SubjectID")
merge(df1, df2, by.x="PatientID", by.y="SubjectID", all=TRUE)
targets <- read_excel("expression_data_vaccination_example.xlsx")
targets <- read_excel("../Datasets/expression_data_vaccination_example.xlsx")
excel_sheets("../Datasets/expression_data_vaccination_example.xlsx")
targets <- read_excel("../Datasets/expression_data_vaccination_example.xlsx", sheet="targets")
lb <- read_csv("labresults_full.csv")
lb <- read_csv("../Datasets/labresults_full.csv")
View(targets)
View(lb)
merged <- merge(lb, targets, by=c("USUBJID", "Timepoint"))
View(merged)
lb2 <- lb[ , c("USUBJID", "Timepoint", "LBTESTCD", "LBORRES")]
lb2
View(lb2)
target2 <- targets[ , c("USUBJID", "Timepoint", "ARM", "AGE", "SEX")]
View(target2)
merged <- merge(lb2, targets2, by=c("USUBJID", "Timepoint"))
merged <- merge(lb2, target2, by=c("USUBJID", "Timepoint"))
View(merged)
lb2w <- pivot_wider(lb2w, id_cols = c("USUBJID", "Timepoint"), names_from="LBTESCD", values_from = "LBORRES")
lb2w <- pivot_wider(lb2, id_cols = c("USUBJID", "Timepoint"), names_from="LBTESCD", values_from = "LBORRES")
lb2w <- pivot_wider(lb2, id_cols = c("USUBJID", "Timepoint"), names_from="LBTESTCD", values_from = "LBORRES")
View(lb2w)
merged2 <- merge(lb2w, target2, by=c("USUBJID", "Timepoint"))
View(merged2)
View(merged2)
savehistory()
timestamp()
