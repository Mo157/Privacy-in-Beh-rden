
#### Bibliotheken laden


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



data %>% 
  filter (which_eID =="Einen eID-fähigen, dessen Funktion ich auch nutze.") %>% 
  describe(data$ATTITUDE_EID)

data %>% 
  filter (which_eID =="Einen eID-fähigen, die Funktion ist aber deaktiviert.") %>% 
  describe(data$ATTITUDE_EID)

## Test auf Varianzgleichheit (signifikant = nicht gleich)

leveneTest(data$KUT ~ data$which_eID)
leveneTest(data$DIG_TECH ~ data$which_eID)
leveneTest(data$ATTITUDE_EID ~ data$which_eID)
leveneTest(data$TRUST_TECH ~ data$which_eID)
leveneTest(data$TRUST_AUTHORITY ~ data$which_eID)
leveneTest(data$SELF_ASSESMENT ~ data$which_eID)
leveneTest(data$DATA_PRIVACY ~ data$which_eID)

plot(data$KUT ~ data$which_eID)

plot(data$DIG_TECH ~ data$which_eID)

plot(data$ATTITUDE_EID ~ data$which_eID)

plot(data$TRUST_TECH ~ data$which_eID)

plot(data$TRUST_AUTHORITY ~ data$which_eID)

plot(data$SELF_ASSESMENT ~ data$which_eID)

plot(data$DATA_PRIVACY ~ data$which_eID)


data %>% 
  filter (which_eID == "Einen eID-fähigen, die Funktion ist aber deaktiviert.") %>% 
  shapiro.test("KUT")

## Test auf Normalverteilung (signifikant = nicht normalverteilt)

data_a <- subset(data, data$which_eID == "Einen eID-fähigen, die Funktion ist aber deaktiviert.")

data_b <- subset(data, data$which_eID == "Einen eID-fähigen, dessen Funktion ich auch nutze.")

View(data_a)


shapiro.test(data_b$age)
shapiro.test(data_b$KUT)
shapiro.test(data_b$DIG_TECH)
shapiro.test(data_b$TRUST_TECH)
shapiro.test(data_b$TRUST_AUTHORITY)
shapiro.test(data_b$DATA_PROTEC)
shapiro.test(data_b$SELF_ASSESMENT)
shapiro.test(data_b$ATTITUDE_EID)

shapiro.test(data_a$KUT)
shapiro.test(data_a$DIG_TECH)
shapiro.test(data_a$TRUST_TECH)
shapiro.test(data_a$TRUST_AUTHORITY)
shapiro.test(data_a$DATA_PROTEC)
shapiro.test(data_a$SELF_ASSESMENT)
shapiro.test(data_a$ATTITUDE_EID)

##Nur DATA Proctect und Self assesment nicht normalverteilt
