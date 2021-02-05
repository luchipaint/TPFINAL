library(topicmodels)
library(tidytext)
library(polAr)
library(tidyverse)
library(tm)
library(NLP)

show_available_speech()

ur_af <- show_available_speech() %>% 
  filter(president %in% c("justo_jose_de_urquiza", "alberto_fernandez")) %>% 
  pull(year)

anios <- enframe(x = ur_af, # Armo data frame con años que quiero descargar discursos
                 name = NULL,
                 value = "year") 

discursos <- map_df(.x = anios$year, 
                    .f = ~ get_speech(.)) # TIDY
