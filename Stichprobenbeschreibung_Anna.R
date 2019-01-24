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


## Geschlecht Diagramm

library(ggplot2)

data$weight = 1 / dim(data)[1]

data %>%
  filter (gender != "Keine Angabe") %>%
ggplot() +
  aes(x = gender, weight = weight) +
  geom_bar(fill = "#08519c") +
  labs(title = "Mehr weibliche als männliche Probanden",
    x = "Geschlecht",
    y = "Prozent ",
    subtitle = "Histogramm der Geschlechterverteilung in Prozent") +
  theme_gray() + 
  scale_y_continuous(limits=c(0,1),
                    label = scales::percent_format(accuracy = 1))

ggsave("Anteil Geschlecht in Prozent.png", width = 9, height = 4)


## Bildung Diagramm (Modus = Studienabschluss)  

library(ggplot2)

data$weight = 1 / dim(data)[1]

data %>%
  filter (education != "Sonstiges (bitte angeben)") %>%
ggplot() +
  aes(x = education, weight = weight) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "Akademische Stichprobe",
    x = "Bildung",
    y = "Prozent",
    subtitle = "Histogramm der Bildungsverteilung in Prozent") +
  theme_gray() + 
  scale_y_continuous(limits=c(0,1),
                     label = scales::percent_format(accuracy = 1))


ggsave("Anteil Bildung in Prozent.png", width = 16, height = 6)


## Alter Diagramm (M= 30.8 ; SD= 13.6)

library(ggplot2)

ggplot(data = data) +
  aes(x = age) +
  geom_histogram(bins = 20, fill = "#0c4c8a") +
  labs(title = "Studentische Stichprobe",
    x = "Alter",
    y = "Häufigkeit (absolut)",
    caption = "Histogramm mit 20 Bins",
    subtitle = "Histogramm der Altersverteilung (absolute Häufigkeit)") +
  theme_gray()

ggsave("Altersverteilung (absolute Häufigkeit).png", width = 9, height = 4)


## KUT Diagramm (M= 3.5 ; SD= 0.5)

library(ggplot2)

ggplot(data = data) +
  aes(x = KUT) +
  geom_histogram(bins = 20, fill = "#0c4c8a") +
  labs(title = "Der KUT liegt zwischen ´Stimme eher nicht zu´und ´Stimme eher zu´",
       x = "KUT [1-6]",
       y = "Häufigkeit (absolut)",
       caption = "Histogramm mit 20 Bins",
       subtitle = "Histogramm der Kontrollüberzeugung im Umgang mit Technik (absolute Häufigkeit)") +
  theme_gray()

ggsave("KUT.png", width = 9, height = 4)




## KUT Boxplott Männer und Frauen (erstmal nihct relevant)

library(ggplot2)

data %>%
  filter (gender != "Keine Angabe") %>%
  ggplot() +
  aes(x = gender, y = KUT) +
  geom_boxplot(fill = "#0c4c8a") +
  labs(title = "KUT im Vergleich zwischen Männern und Frauen",
    x = "Geschlecht",
    y = "KUT [1-6]",
    subtitle = "Boxplott: Männer glauben eher daran, Technik kontrollieren zu können") +
  theme_gray()





 

