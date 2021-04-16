# load librarys ----
library(readxl)
library(tidyverse)
library(broom)
#### Exercise 4.1 / how to get to labresults_wide_full.csv ----
# load data ----

## load in the meta data
# check how many (and which) sheets you actually have in your excel sheet
excel_sheets("Datasets/expression_data_vaccination_example.xlsx") 

targets <- read_excel("Datasets/expression_data_vaccination_example.xlsx", 
                      sheet = "targets")

## load in the data
lab <- read_csv("Datasets/labresults_full.csv")


## just for fun: create a new column in targets just containing the study
targets$study <- gsub("-.*", replacement = "", targets$USUBJID) 


# select certain columns and coditions, merge metadata and results ----

### target

# tidyverse way to select certain columns
targets %>%
  select(Timepoint, USUBJID, ARM:SEX) -> targets

# equal to 
targets <- select(targets, Timepoint, USUBJID, ARM, SEX, AGE) 

# base R variant
targets <- targets[, c("Timepoint", "USUBJID", "ARM", "SEX", "AGE")]

### lab
lab %>% 
  select(USUBJID:LBTESTCD, LBORRES, Timepoint) %>% 
  ## just for fun: to filter for several non-matching conditions:
  # filter(!Timepoint %in% c("SCREEN", "BL"))
  ## ! always negotiates
  filter(Timepoint != "SCREEN") -> lab


## merging 
# # not what we want, has 2 timepoint columns
# merged <- merge(targets, lab, all = TRUE,  by = "USUBJID")
# # what we want: a table with one timepoint column

# tidyverse way
targets %>% 
  # select everything beside Timepoint
  select(-Timepoint) %>% 
  # make rows unique
  distinct() -> targets2

# base R way
# option 1
targets_base <- targets[,c("USUBJID", "ARM", "SEX", "AGE")] # -c("Timepoint") won't work here
# option 2
targets_base <- targets[,-c(1)] # or: targets[, 2:ncol(targets)]

# remove duplicated lines
targets_base <- targets_base[!duplicated(targets_base$USUBJID), ]


## merging as we want to do it 
### keep all timepoints in data
merged_full <- merge(targets2, lab, by = "USUBJID")
# tidyverse way
left_join(targets2, lab, by = "USUBJID")


### keep only timepoints that are in target
merged <- merge(targets, lab, by = c("USUBJID", "Timepoint"))

# tidyverse way
inner_join(targets, lab, by = c("USUBJID", "Timepoint"))








  


# make wide format out of our data ----
# not working as we want 
# LBTEST is a useful information but different for different values
merged %>% 
  pivot_wider(names_from = "LBTESTCD", values_from = "LBORRES")

# complete tidyverse way
merged %>% 
  pivot_wider(-LBTEST, names_from = "LBTESTCD", values_from = "LBORRES") -> labwide

# or
merged %>% 
  select(-LBTEST) %>% 
  pivot_wider(names_from = "LBTESTCD", values_from = "LBORRES")

# half tidyverse way
labwide <- pivot_wider(merged[ , colnames(merged) != "LBTEST"], names_from="LBTESTCD", values_from="LBORRES")


# what you also could do (but probably won't as your columnames get longer and you are lazy)
merged %>% 
  # combine LBTEST and LBTESTCD column to another one
  mutate(LBTEST_combined = paste(LBTEST, LBTESTCD, sep = " ")) %>%
  # remove the columns that we just combined 
  select(-c(LBTEST, LBTESTCD)) %>% 
  # make this a wide tibble
  pivot_wider(names_from = "LBTEST_combined", values_from = "LBORRES")


# clean data ----
## for all columns in labwide, check the class
sapply(labwide, class) 
# everything is a character
# clean it!
# ....



#### Exercise 4.2 ----
# load data ---- 
labwide <- read_csv("Datasets/labresults_wide_full.csv")[, -1 ]


fluad    <- labwide$ARM == "FLUAD"
agrippal <- labwide$ARM == "AGRIPPAL"

d0 <- labwide$Timepoint == "D0"
d1 <- labwide$Timepoint == "D1"


# testing ----

# create an empty list (so you can apply functions on the lists elements lateron)
test_list <- list()
# each test is assigned to be a new element in this list
test_list$crp_fluad <- t.test(labwide$CRP[d0 & fluad], labwide$CRP[d1 & fluad], paired=TRUE)

# take a look at how the object returned by t-test looks like
class(test_list$crp_fluad) # special object but basically works like a list
View(test_list$crp_fluad) 
test_list$crp_fluad$p.value # enter a specific part of the list
tidy(test_list$crp_fluad) # enters and combines several parts of that list (comes with broom)

# repeat for the other three options
test_list$crp_agri <- t.test(labwide$CRP[d0 & agrippal], labwide$CRP[d1 & agrippal], paired=TRUE)

### for lymphocytes
test_list$lym_fluad <- t.test(labwide$LYM[d0 & fluad], labwide$LYM[d1 & fluad], paired=TRUE)
test_list$lym_agri <- t.test(labwide$CRP[d0 & agrippal], labwide$CRP[d1 & agrippal], paired=TRUE)

# probably you want to loop here instead of copy and paste stuff

# wilcox test
test_list$crp_fluad_wilcox <- wilcox.test(labwide$CRP[d0 & fluad], labwide$CRP[d1 & fluad])

# take a look at how the object returned by wilcox looks like
class(test_list$crp_fluad_wilcox) 
View(test_list$crp_fluad_wilcox) 

test_list$crp_agri_wilcox <- wilcox.test(labwide$CRP[d0 & agrippal], labwide$CRP[d1 & agrippal], paired=TRUE)

# for lymphocytes
test_list$lym_fluad_wilcox <- wilcox.test(labwide$LYM[d0 & fluad], labwide$LYM[d1 & fluad], paired=TRUE)
test_list$lym_agri_wilcox <- wilcox.test(labwide$CRP[d0 & agrippal], labwide$CRP[d1 & agrippal], paired=TRUE)


View(test_list)

# tidy all the tests ----
test_list_tidy <- lapply(X = test_list, FUN = tidy)
# apply is a big family of functions. The "L" in lapply stands for list and states that you want your results returned as a list

# just for fun: using apply with your own function:
# tbh it does not make sense here, as we just use tidy in the function body
# useful when you make several steps after each other 
lapply(X = test_list, FUN = function(data){ # create your own function that takes one argument (your data you give in x)
  data <- tidy(data)
  return(data)
  }
)




rbind(test_list_tidy$crp_fluad, test_list_tidy$crp_agri, 
      test_list_tidy$lym_fluad) #... and so on - put all together manually (or do some kind of loop)

# combine my elements of the list (tidyverse way, does not work with rbind)
test_list_tidy %>% 
  bind_rows() -> tests
# information of what you actually tested gets lost 
# add this information again
# names return the names of each list/vector elment (equally to rownames() or colnames() on dataframes)
# get the names returned and assign them to another column
tests$tested_data <- names(test_list_tidy)





### another way doing this (and less writing):
# use the map_df function to map (basically apply) tidy to each element in your list
# map_df returns a dataframe (so you do not have to do the bind_rows afterwards
# and you also can assign a specific column that contains the names of your elements in the list via the .id argument)
tests <- map_df(test_list, tidy, .id = "tested_data")
# again: map is a big family of functions, map_df is just one of them


