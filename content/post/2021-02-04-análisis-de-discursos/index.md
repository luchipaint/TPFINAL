---
title: Análisis de discursos
author: ~
slug: análisis-de-discursos
categories: []
tags: []
---

```{r, include=TRUE, warning=FALSE, message=FALSE}

library(polAr)
library(dplyr)
library(tm)
library(topicmodels)
library(tidyverse)
library(ggplot2)
library(forcats)
library(patchwork)
library(wordcloud2)

show_available_speech()

urquiza <- get_speech(year = 1854)

frecuencia <- urquiza %>% 
  group_by(word) %>% 
  count() %>% 
  arrange(desc(n))

nubeurquiza <- wordcloud2::wordcloud2(frecuencia)

print(nubeurquiza)

```

### Alberto

```{r, include=TRUE}

alberto <- get_speech(year = 2020)

frecuencia2 <- alberto %>% 
  group_by(word) %>% 
  count() %>% 
  arrange(desc(n))

nubealberto <- wordcloud2::wordcloud2(frecuencia2)

```

### Gráficos

```{r, include=TRUE, warning=FALSE, message=FALSE}

frecuencia3 <- alberto %>% 
  group_by(word) %>% 
  count() %>%
  arrange(desc(n)) %>% 
  ungroup() %>% 
  slice(1:5)

frecuencia4 <- urquiza %>% 
  group_by(word) %>% 
  count() %>%
  arrange(desc(n)) %>% 
  ungroup() %>% 
  slice(1:5)

barraslaberto <- ggplot(data = frecuencia3,
                        mapping = aes(x = word, y = n)) +
  geom_col() +
  ggthemes::theme_economist() +
  labs(title = "Palabras más usadas por Alberto Fernandez",
       subtitle = "Inicio de Asamblea Legislativa 2020",
       caption = "Fuente: Datos de polAr",
       y = "",
       x = "")

barrasurquiza <- ggplot(data = frecuencia4,
                        mapping = aes(x = word, y = n)) +
  geom_col() +
  ggthemes::theme_economist() +
  labs(title = "Palabras más usadas por Urquiza",
       subtitle = "Inicio de Asamblea Legislativa 1854",
       caption = "Fuente: Datos de polAr",
       y = "",
       x = "")

barrasurquiza + barraslaberto

```
