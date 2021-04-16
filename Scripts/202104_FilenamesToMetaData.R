library(tidyverse)
# meta information from file-names ----
folder <- "data"
list.files(folder, pattern = ".csv")

fnames <- c("ctrl_FOV1_20210118_mu_Duo_GATA3-eGFPcell.csv",
            "ctrl_FOV1_20210118_mu_Duo_GATA3-eGFPnuclei.csv",
            "IL-33Day3_FOV1_20210115_mu_Duo_GATA3-eGFPcell.csv",
            "IL-33Day3_FOV1_20210115_mu_Duo_GATA3-eGFPnuclei.csv")

meta <- fnames %>% 
  enframe() %>% # enframe(fnames)
  separate(col = value, into = c("treatment", "FOV", "date", "organism",
                                 "organ", "last"),
           sep = "_", remove = FALSE) %>% 
  separate(col = last, into =c("strain", "cellpart"), sep = "-")

meta <- meta %>% 
  rename(fname = value) %>% 
  select(-name) %>% 
  mutate(cellpart = str_replace(cellpart, "\\.csv$", ""))

# sketch an idea
names(fnames) <- fnames
res <- lapply(fnames, function(x){
  data <- read_csv(x)
  # pivot_longer
  # summarize -> mean / sd  -> summary
  # mutate (standardize with summary) -> result
  return(result)
})

# if it gets too long
# this is not clean code!
preprocessMyData <- function(x){
  # read in 
  # clean
  # batch-correction
  # your steps
}

lapply(fnames, preprocessMyData)

# merging nuclei/cell
merge / full_join

# combine data sets
# keep an identifier for data set
bind_rows()


res %>% 
  bind_rows(.id = fname) -> measurements

measurements %>% 
  left_join(meta, by = fname)