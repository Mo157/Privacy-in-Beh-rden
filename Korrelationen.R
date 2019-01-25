
#### Bibliotheken laden

library(plotrix)
library(tidyverse)
library(lubridate)
library(psych)
library(esquisse)
library(ggthemes)
library(ggplot2)
library(devtools)
library(jmv)
library(car)

devtools::install_github("HCIC/r-tools")

source("surveymonkey.R")


#### Datei laden ----

data <- readRDS("data/Smart Identification2.rds")

View(data)

#### Deskriotive Statistik für unabhängige Variablen ----

data %>% 
  select(age, KUT, PRIVACY, DIG_TECH, DATA_PROTEC, TRUST_TECH, DIG_TECH, TRUE_FALSE, TRUST_AUTHORITY, DATA_PRIVACY) -> data_iv

data_iv %>%  describe()

#### Deskriptive Statistik für abhängige Variablen ----

data %>% 
  select (which_eID, Statement1, ATTITUDE_EID, SELF_ASSESMENT) -> data_dv

data_dv %>% describe()

table(data$which_eID)
table(data$residence)
table(data$info_eID)
table(data$bad_exp)
table(data$education)
table(data$Statement1)

table(data$TRUE_FALSE)

### Analyse der unabhängigen Varibalen ----


columns <- c("age", "KUT", "DIG_TECH", "TRUST_TECH", "DIG_TECH", "TRUE_FALSE", "TRUST_AUTHORITY", "DATA_PRIVACY")

jmv::corrMatrix(data_iv, vars = c( "KUT", "DIG_TECH", "TRUST_TECH", "DIG_TECH", "TRUE_FALSE", "TRUST_AUTHORITY", "DATA_PRIVACY"))


jmv::linReg(data_iv, dep= "DIG_TECH", covs = c( "KUT", "TRUST_TECH"), blocks = c( "KUT", "TRUST_TECH"))

jmv::linReg(data_iv, dep= "DATA_PRIVACY", covs = c( "TRUST_AUTHORITY", "TRUST_TECH"), blocks = c( "TRUST_AUTHORITY", "TRUST_TECH"))

#### Analyse der abhängigen Variablen

jmv::corrMatrix(data, vars = c( "age", "KUT", "DIG_TECH", "TRUST_TECH", "TRUST_AUTHORITY", "DATA_PRIVACY", "ATTITUDE_EID", "SELF_ASSESMENT"))


#Einstellung zur EID'



jmv::linReg(data, dep= "ATTITUDE_EID", covs = c (  "DIG_TECH", "TRUST_TECH", "TRUST_AUTHORITY"), 
            blocks = c ( "DIG_TECH", "TRUST_TECH", "TRUST_AUTHORITY"),
            stdEst = TRUE)

jmv::linReg(data, dep= "ATTITUDE_EID", covs = c (  "DIG_TECH", "TRUST_AUTHORITY", "SELF_ASSESMENT"), 
            blocks = c ( "DIG_TECH", "TRUST_AUTHORITY", "SELF_ASSESMENT"),
            stdEst = TRUE)


#SElbsteinschätzung


jmv::linReg(data, dep= "SELF_ASSESMENT", covs = c ( "KUT", "DIG_TECH", "TRUST_TECH", "TRUST_AUTHORITY", "DATA_PRIVACY"), 
            blocks = c ( "KUT", "DIG_TECH", "TRUST_TECH", "TRUST_AUTHORITY", "DATA_PRIVACY"),
            stdEst = TRUE)

jmv::linReg(data, dep= "SELF_ASSESMENT", covs = c ( "TRUST_AUTHORITY", "FALSE_S"), 
            blocks = c ( "TRUST_AUTHORITY", "FALSE_S"),
            stdEst = TRUE)

jmv::corrMatrix(data, vars = c( "SELF_ASSESMENT", "FALSE_S"))




#Rangkorrelation




data2 <- data

data2$bad_exp <- factor(data$bad_exp)

data2$bad_exp <- as.numeric(data2$bad_exp)

data2$bad_exp

View(data2)

jmv::corrMatrix(data2, vars = c( "TRUST_AUTHORITY", "bad_exp"), spearman = TRUE, pearson = FALSE)

jmv::anova(data$which_eID, data$KUT)

ANOVA(data, dep = KUT, factors = which_eID)

#data %>% 
  filter(which_eID != "Ich weiß es nicht.") %>% 
  ANOVA(dep = age, factors = which_eID)

#data %>% 
  filter(which_eID != "Ich weiß es nicht.") %>% 
  ANOVA(dep = KUT, factors = which_eID, postHocCorr = list("bonf"))


#data %>% 
  filter(which_eID != "Ich weiß es nicht.") %>% 
  ANOVA(dep = DIG_TECH, factors = which_eID, postHocCorr = list("bonf"))

#data %>% 
  filter(which_eID != "Einen alten, der nicht eID-fähig ist.") %>% 
  ANOVA(dep = TRUST_TECH, factors = which_eID, postHocCorr = list("bonf"))

data %>% 
  ANOVA(dep = TRUST_TECH, factors = which_eID, postHocCorr = list("bonf"))

data %>% 
  ANOVA(dep = TRUST_AUTHORITY, factors = which_eID, postHocCorr = list("bonf"))

#data %>% 
  filter(which_eID != "Ich weiß es nicht.") %>% 
  ANOVA(dep = DIG_TECH, factors = which_eID, postHocCorr = list("bonf"))


ANOVA(data, dep = DIG_TECH, factors = which_eID)

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DIG_TECH)


t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUST_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUST_TECH)


t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUST_AUTHORITY,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUST_AUTHORITY)

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$ATTITUDE_EID,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$ATTITUDE_EID)

t.test(filter(data, residence== "Ich wohne auf dem Land.")$Statement1,
       filter(data, residence== "Ich wohne zentral in einer Stadt.")$Statement1)

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$age,
       filter(data, which_eID== "Einen alten, der nicht eID-fähig ist.")$age)



# Deskriptive Statistik EID



table(data$which_eID)

describe(data$ATTITUDE_EID)


#Korrelationen ATTITUDE_EID und folgende Lineare Regression

jmv::corrMatrix(data, vars = c( "age", "KUT", "DIG_TECH", "TRUST_TECH", "TRUST_AUTHORITY",  "ATTITUDE_EID", "SELF_ASSESMENT"))


jmv::linReg(data, dep= "ATTITUDE_EID", covs = c (  "DIG_TECH", "TRUST_AUTHORITY", "SELF_ASSESMENT"), 
            blocks = c ( "DIG_TECH", "TRUST_AUTHORITY", "SELF_ASSESMENT"),
            stdEst = TRUE)


#Unterschiede zwischen Gruppen


#-- ZUerst:Untersuchung der Varianz und Normalverteilung

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$KUT,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$KUT)


t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DIG_TECH)




library(ggplot2)

data %>% 
  filter (gender != "keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mean_kut = mean(KUT), sem_kut = stderr(KUT))

ggplot(data = data) +
  aes(x = which_eID, y = DIG_TECH) +
  geom_boxplot(fill = "#0c4c8a") +
  labs(title = "Nutzer der eID haben eine höhere Digitalisierungsaffinität",
    x = "Art des Ausweises",
    y = "Digitalisierungsaffinität [1-6]",
    subtitle = "Boxplot der Mittelwerte der zwei Nutzergruppen") +
  theme_grey()
summarise(mean_kut = mean(KUT), sem_kut =std.error(KUT)) %>% 

library(ggplot2)

data %>%
  filter(gender!= "Keine Angabe") %>% 
  group_by(gender) %>% 
  summarise(mean_kut = mean(KUT), sem_kut =std.error(KUT)) %>% 
ggplot() +
  aes(x = gender, weight = mean_kut, fill = gender, ymin= mean_kut - sem_kut , ymax= mean_kut + sem_kut) +
  geom_errorbar()+
  geom_bar(fill = "#0c4c8a") +
  theme_gray() +
  labs(title = "Männer sind so",
       x = "Geschlecht",
       y = "KUT",
       subtitle = "Säulendiagramm",
       fill = "Geschlecht",
       caption= "Fehlerbalken zeigen den Standardfehler des Mittelwerts") 





data %>%
  filter(which_eID!= "Ich weiß es nicht.") %>% 
  filter(which_eID!= "Einen alten, der nicht eID-fähig ist.") %>%
  group_by(which_eID) %>% 
  summarise(mean_DIG_TECH = mean(DIG_TECH)-1, sem_DIG_TECH =std.error(DIG_TECH)) %>% 
  ggplot() +
  aes(x = which_eID, weight = mean_DIG_TECH, fill = which_eID, ymin= mean_DIG_TECH - sem_DIG_TECH , ymax= mean_DIG_TECH + sem_DIG_TECH) +
  geom_bar(fill = "#0c4c8a", width = 0.5) +
  geom_errorbar(width= 0.2)+
  ylim(0,5)+
  theme_gray() +
  labs(title = "Die Nutzergruppen unterscheiden sich im Mittel nicht in ihrer Digitalisierungsaffinität",
       x = "Art des Ausweises",
       y = "Digitalisierungsaffinität [0-5]",
       subtitle = "Balkendiagram: Digitalisierungsaffinität im Vergleich zwischen Nutzern verschiedener Ausweistypen",
       fill = "Art des Ausweises",
       caption= "Fehlerbalken zeigen den Standardfehler des Mittelwerts") 


ggsave("Digitalisierungsaffinität.pdf", width = 8.5, height = 5)
  NULL
  

  data %>%
    filter(which_eID!= "Ich weiß es nicht.") %>% 
    filter(which_eID!= "Einen alten, der nicht eID-fähig ist.") %>%
    group_by(which_eID) %>% 
    summarise(mean_TRUST_AUTHORITY = mean(TRUST_AUTHORITY)-1, sem_TRUST_AUTHORITY =std.error(TRUST_AUTHORITY)) %>% 
    ggplot() +
    aes(x = which_eID, weight = mean_TRUST_AUTHORITY, fill = which_eID, ymin= mean_TRUST_AUTHORITY - sem_TRUST_AUTHORITY , ymax= mean_TRUST_AUTHORITY + sem_TRUST_AUTHORITY) +
    #scale_fill_manual(values = c("blue","red")) %>% 
    geom_bar(fill = "#0c4c8a", width = 0.5) +
    geom_errorbar(width= 0.2)+
    ylim(0,5)+
    theme_gray() +
    labs(title = "Die Nutzergruppen unterscheiden sich im Mittel nicht in ihrem Vertrauen in Behörden",
         x = "Art des Ausweises",
         y = "Vertrauen in Behörden [0-5]",
         subtitle = "Balkendiagram: Vertrauen in Behörden im Vergleich zwischen Nutzern verschiedener Ausweistypen",
         fill = "Art des Ausweises",
         caption= "Fehlerbalken zeigen den Standardfehler des Mittelwerts") 
  
  ggsave("Vertrauen_in_Behörden.pdf", width = 8.5, height = 5)
  NULL
  
  

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUST_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUST_TECH)


t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUST_AUTHORITY,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUST_AUTHORITY)

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$ATTITUDE_EID,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$ATTITUDE_EID)

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$SELF_ASSESMENT,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$SELF_ASSESMENT)

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DATA_PRIVACY,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DATA_PRIVACY)


t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$KUT,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$KUT)

## Wilcox test

wilcox.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DIG_TECH)


wilcox.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUST_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUST_TECH)


wilcox.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUST_AUTHORITY,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUST_AUTHORITY)

wilcox.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$ATTITUDE_EID,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$ATTITUDE_EID)

wilcox.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$SELF_ASSESMENT,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$SELF_ASSESMENT)

wilcox.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DATA_PRIVACY,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DATA_PRIVACY)









