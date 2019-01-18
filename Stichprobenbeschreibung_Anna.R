##### Stichprobenbeschreibung 

# Bibliotheken installieren

install.packages("scales")
install.packages("tidyverse")
install.packages("psych")
install.packages("lubridate")
install.packages("esquisse")
install.packages("ggthemes")
install.packages("ggplot2")


#Bibliotheken laden

library(scales)
library(tidyverse)
library(psych)
library(lubridate)
library(esquisse)
library(ggthemes)
library(ggplot2)

data <- readRDS("data/Smart Identification2.rds")


psych::describe(data)

## Prozent


data %>% 
  group_by(gender) %>% 
  summarise(count = n()/dim(data)[1]) %>% 
  ggplot() +
  aes(x=gender, y=count) + geom_col() + 
  scale_y_continuous(limits=c(0,1),
                     label = scales::percent_format(accuracy = 1))
