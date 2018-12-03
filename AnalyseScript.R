# Analyse Script

install.packages("tidyverse")
install.packages("lubridate")
install.packages("psych")
install.packages("esquisse")
install.packages("ggthemes")
install.packages("ggplot2")

install.packages("devtools")
library(devtools)
devtools::install_github("HCIC/r-tools")

source("surveymonkey.R")


#### Datei laden ----
filename <- "data/Smart Identification.csv"
raw <- load_surveymonkey_csv(filename)


#### Daten cleanen----

raw.short <- raw[,c(-1:-9, -90:-126)]
generate_codebook(raw.short, "codebook.csv")

codebook <- read_codebook("codebook_final.csv")

names(raw.short) <- codebook$variable

raw.short$gender <- as.factor(raw.short$gender)

scale.zustimmung <-c("Stimme gar nicht zu", 
                     "Stimme nicht zu", 
                     "Stimme eher nicht zu", 
                     "Stimme eher zu", 
                     "Stimme zu", 
                     "Stimme völlig zu")

raw.short$kut1 <- ordered(raw.short$kut1, levels = scale.zustimmung)
raw.short$kut2 <- ordered(raw.short$kut2, levels = scale.zustimmung)
raw.short$kut3 <- ordered(raw.short$kut3, levels = scale.zustimmung)
raw.short$kut4 <- ordered(raw.short$kut4, levels = scale.zustimmung)
raw.short$kut5 <- ordered(raw.short$kut5, levels = scale.zustimmung)
raw.short$kut6 <- ordered(raw.short$kut6, levels = scale.zustimmung)
raw.short$kut7 <- ordered(raw.short$kut7, levels = scale.zustimmung)
raw.short$kut8 <- ordered(raw.short$kut8, levels = scale.zustimmung)

raw.short$privacy1 <- ordered(raw.short$privacy1, levels = scale.zustimmung)
raw.short$privacy2 <- ordered(raw.short$privacy2, levels = scale.zustimmung)
raw.short$privacy3 <- ordered(raw.short$privacy3, levels = scale.zustimmung)

raw.short$data_protec1 <- ordered(raw.short$data_protec1, levels = scale.zustimmung)
raw.short$data_protec2 <- ordered(raw.short$data_protec2, levels = scale.zustimmung)
raw.short$data_protec3 <- ordered(raw.short$data_protec3, levels = scale.zustimmung)

raw.short$buy_tech1 <- ordered(raw.short$buy_tech1, levels = scale.zustimmung)
raw.short$buy_tech2 <- ordered(raw.short$buy_tech2, levels = scale.zustimmung)
raw.short$buy_tech3 <- ordered(raw.short$buy_tech3, levels = scale.zustimmung)
raw.short$buy_tech4 <- ordered(raw.short$buy_tech4, levels = scale.zustimmung)
raw.short$buy_tech5 <- ordered(raw.short$buy_tech5, levels = scale.zustimmung)
raw.short$buy_tech6 <- ordered(raw.short$buy_tech6, levels = scale.zustimmung)

raw.short$trust_tech1 <- ordered(raw.short$trust_tech1, levels = scale.zustimmung)
raw.short$trust_tech2 <- ordered(raw.short$trust_tech2, levels = scale.zustimmung)
raw.short$trust_tech3 <- ordered(raw.short$trust_tech3, levels = scale.zustimmung)
raw.short$trust_tech4 <- ordered(raw.short$trust_tech4, levels = scale.zustimmung)
raw.short$trust_tech5 <- ordered(raw.short$trust_tech5, levels = scale.zustimmung)
raw.short$trust_tech6 <- ordered(raw.short$trust_tech6, levels = scale.zustimmung)
raw.short$trust_tech7 <- ordered(raw.short$trust_tech7, levels = scale.zustimmung)

raw.short$dig_tech1 <- ordered(raw.short$dig_tech1, levels = scale.zustimmung)
raw.short$dig_tech2 <- ordered(raw.short$dig_tech2, levels = scale.zustimmung)
raw.short$dig_tech3 <- ordered(raw.short$dig_tech3, levels = scale.zustimmung)
raw.short$dig_tech4 <- ordered(raw.short$dig_tech4, levels = scale.zustimmung)
raw.short$dig_tech5 <- ordered(raw.short$dig_tech5, levels = scale.zustimmung)
raw.short$dig_tech6 <- ordered(raw.short$dig_tech6, levels = scale.zustimmung)
raw.short$dig_tech7 <- ordered(raw.short$dig_tech7, levels = scale.zustimmung)
raw.short$dig_tech8 <- ordered(raw.short$dig_tech8, levels = scale.zustimmung)

raw.short$true_false1 <- ordered(raw.short$true_false1, levels = scale.zustimmung)
raw.short$true_false2 <- ordered(raw.short$true_false2, levels = scale.zustimmung)
raw.short$true_false3 <- ordered(raw.short$true_false3, levels = scale.zustimmung)
raw.short$true_false4 <- ordered(raw.short$true_false4, levels = scale.zustimmung)
raw.short$true_false5 <- ordered(raw.short$true_false5, levels = scale.zustimmung)

raw.short$trust_authority1 <- ordered(raw.short$trust_authority1, levels = scale.zustimmung)
raw.short$trust_authority2 <- ordered(raw.short$trust_authority2, levels = scale.zustimmung)
raw.short$trust_authority3 <- ordered(raw.short$trust_authority3, levels = scale.zustimmung)
raw.short$trust_authority4 <- ordered(raw.short$trust_authority4, levels = scale.zustimmung)
raw.short$trust_authority5 <- ordered(raw.short$trust_authority5, levels = scale.zustimmung)
raw.short$trust_authority6 <- ordered(raw.short$trust_authority6, levels = scale.zustimmung)
raw.short$trust_authority7 <- ordered(raw.short$trust_authority7, levels = scale.zustimmung)
raw.short$trust_authority8 <- ordered(raw.short$trust_authority8, levels = scale.zustimmung)
raw.short$trust_authority9 <- ordered(raw.short$trust_authority9, levels = scale.zustimmung)

raw.short$knowledge1 <- ordered(raw.short$knowledge1, levels = scale.zustimmung)
raw.short$knowledge2 <- ordered(raw.short$knowledge2, levels = scale.zustimmung)
raw.short$knowledge3 <- ordered(raw.short$knowledge3, levels = scale.zustimmung)
raw.short$knowledge4 <- ordered(raw.short$knowledge4, levels = scale.zustimmung)
raw.short$knowledge5 <- ordered(raw.short$knowledge5, levels = scale.zustimmung)
raw.short$knowledge6 <- ordered(raw.short$knowledge6, levels = scale.zustimmung)
raw.short$knowledge7 <- ordered(raw.short$knowledge7, levels = scale.zustimmung)
raw.short$knowledge8 <- ordered(raw.short$knowledge8, levels = scale.zustimmung)


library(psych)

schluesselliste <- list(KUT= c("kut1", "-kut2", "kut3", "kut4", "-kut5", "kut6", "-kut7", "-kut8"),
                        PRIVACY= c("privacy1", "privacy2", "-privacy3"),
                        DATA_PROTEC= c("data_protec1", "data_protec2", "-data_protec3"),
                        BUY_TECH= c("buy_tech1", "buy_tech2", "buy_tech3", "buy_tech4", "buy_tech5", "buy_tech6"),
                        TRUST_TECH= c("trust_tech1", "trust_tech2", "trust_tech3", "trust_tech4", "trust_tech5", "-trust_tech6", "-trust_tech7"),
                        DIG_TECH= c("dig_tech1", "-dig_tech2", "dig_tech3", "-dig_tech4", "dig_tech5", "-dig_tech6", "dig_tech7", "dig_tech8"),
                        TRUE_FALSE= c("true_false1", "true_false2", "true_false3", "true_false4", "true_false5"),
                        TRUST_AUTHORITY= c("trust_authority1", "-trust_authority2", "-trust_authority3", "-trust_authority4", "trust_authority5", "-trust_authority6", "-trust_authority7", "-trust_authority8", "-trust_authority9"),
                        KNOWLEDGE= c("knowledge1", "-knowledge2", "-knowledge3", "-knowledge4", "knowledge5", "-knowledge6", "knowledge7", "-knowledge8"))

scores <- scoreItems(schluesselliste, raw.short, missing = TRUE, min = 1, max = 6)

data <- bind_cols(raw.short, as.tibble(scores$scores))
data <- data %>% 
  select(-starts_with("kut", ignore.case = F)) %>% 
  select(-starts_with("privacy", ignore.case = F)) %>%
  select(-starts_with("data_protec", ignore.case = F)) %>%
  select(-starts_with("buy_tech", ignore.case = F)) %>%
  select(-starts_with("trust_tech", ignore.case = F)) %>%
  select(-starts_with("dig_tech", ignore.case = F)) %>%
  select(-starts_with("true_false", ignore.case = F)) %>%
  select(-starts_with("trust_authority", ignore.case = F)) %>% 
  select(-starts_with("knowledge", ignore.case = F))


saveRDS(data, "data/Smart Identification2.rds")

###sollte jetzt eigentlich fertig sein

##### FEEDBACK: Sieht sehr gut aus, PRIVACY und DATA_PROTEC sind aber leer. Kleiner Tipp: Die Items dazu haben eine andere Skalenbeschriftung.----


