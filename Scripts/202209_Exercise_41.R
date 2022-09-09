library(tidyverse)
data <- read_csv("Datasets/transcriptomics_results.csv")
# working on columns
data %>% 
  select(GeneName, logFC.F.D1, qval.F.D1) %>% 
  rename(Gene = GeneName,
         LFC = logFC.F.D1, 
         p.value = qval.F.D1) -> data

# working on rows
data %>% 
  filter(p.value < 0.05) %>%  
  filter(abs(LFC) > 1.5) %>% 
  filter(LFC < 0) %>% 
  nrow()

data %>% 
  filter(p.value < 0.05 & abs(LFC) > 1.5)

data %>% 
  filter(p.value < 0.05 & (LFC > 1.5 | LFC < -1.5))

# combining boolean vectors
data$LFC > 1.5 & data$p.value < 0.05
