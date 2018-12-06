# Data Cleaning Dummydatensatz

#### Bibliotheken laden

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

filename <- "data/smart_identification.csv"
raw <- load_surveymonkey_csv(filename)


#### Daten cleanen----

# Schritt 1: unnötige Spalten löschen 

raw.short <- raw[,c(-1:-9, -51,-76, -77, -85, -86, -90:-126)] 


# Schritt 2: Variablen umbenennen

# Codebuch generieren, nur einmal ausführen, um sicher zustellen, dasses nicht überschrieben wird
generate_codebook(raw.short, "codebook.csv")

codebook <- read_codebook("codebook_final.csv")

#neue Namen auf die Daten anwenden:
names(raw.short) <- codebook$variable

View(raw.short)


# Schritt 3: Variablen den richtigen Typen zuordnen


# Items zu kategorialer Variable machen:
raw.short$gender <- as.factor(raw.short$gender)
raw.short$job <- as.factor(raw.short$job)
raw.short$which_eID <- as.factor(raw.short$which_eID)
raw.short$info_eID <- as.factor(raw.short$info_eID)

# Skala für Ordinalskalen anlegen:

scale.education <-c("Hauptschulabschluss", 
                  "Realschulabschluss", 
                  "Fachabitur/Abitur", 
                  "Berufsausbildung", 
                  "Studienabschluss (Bachelor, Master, Magister, Diplom, Promotion etc.)") 


scale.residence <-c("Ich wohne auf dem Land.", 
                   "Ich wohne im Vorort einer Stadt.", 
                   "Ich wohne am Stadtrand.", 
                   "Ich wohne zentral in einer Stadt.")

scale.socialmedia <-c("Mehrmals täglich", 
                      "Einmal täglich", 
                      "Mehrmals wöchentlich", 
                      "Einmal wöchentlich", 
                      "Seltener als einmal wöchentlich", 
                      "Nie")

scale.bad_exp <-c ("Ja, schon mehrfach.", 
                   "Ja, aber nur in einem Einzelfall.", 
                   "Nein, noch nie.")

# Skala für Likertskala anlegen:
scale.zustimmung <-c("Stimme gar nicht zu", 
                     "Stimme nicht zu", 
                     "Stimme eher nicht zu", 
                     "Stimme eher zu", 
                     "Stimme zu", 
                     "Stimme völlig zu")


# Likert-Items zu ordinalen levels machen:

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
raw.short$true_false6 <- ordered(raw.short$true_false6, levels = scale.zustimmung)

raw.short$trust_authority1 <- ordered(raw.short$trust_authority1, levels = scale.zustimmung)
raw.short$trust_authority2 <- ordered(raw.short$trust_authority2, levels = scale.zustimmung)
raw.short$trust_authority3 <- ordered(raw.short$trust_authority3, levels = scale.zustimmung)
raw.short$trust_authority4 <- ordered(raw.short$trust_authority4, levels = scale.zustimmung)
raw.short$trust_authority5 <- ordered(raw.short$trust_authority5, levels = scale.zustimmung)
raw.short$trust_authority6 <- ordered(raw.short$trust_authority6, levels = scale.zustimmung)
raw.short$trust_authority7 <- ordered(raw.short$trust_authority7, levels = scale.zustimmung)

raw.short$Statement1 <- ordered(raw.short$Statement1, levels = scale.zustimmung)
raw.short$statement2 <- ordered(raw.short$statement2, levels = scale.zustimmung)
raw.short$statement3 <- ordered(raw.short$statement3, levels = scale.zustimmung)
raw.short$statement4 <- ordered(raw.short$statement4, levels = scale.zustimmung)
raw.short$statement5 <- ordered(raw.short$statement5, levels = scale.zustimmung)
raw.short$statement6 <- ordered(raw.short$statement6, levels = scale.zustimmung)




#### Schritt 4: Skalen berechnen

library(psych)

schluesselliste <- list(KUT= c("kut1", "-kut2", "kut3", "kut4", "kut5", "kut6", "kut7", "kut8"),
                        PRIVACY= c("privacy1", "privacy2", "-privacy3"),
                        DATA_PROTEC= c("data_protec1", "data_protec2", "-data_protec3"),
                        BUY_TECH= c("buy_tech1", "buy_tech2", "buy_tech3", "buy_tech4", "buy_tech5", "buy_tech6"),
                        TRUST_TECH= c("trust_tech1", "trust_tech2", "trust_tech3", "trust_tech4", "trust_tech5", "-trust_tech6"),
                        DIG_TECH= c("dig_tech1", "-dig_tech2", "dig_tech3", "dig_tech4", "dig_tech5", "-dig_tech6", "dig_tech7", "dig_tech8"),
                        TRUE_FALSE= c("true_false1", "true_false2", "-true_false3", "-true_false4", "true_false5", "-true_false6"),
                        TRUST_AUTHORITY= c("trust_authority1", "trust_authority2", "-trust_authority3", "-trust_authority4", "-trust_authority7"),
                        ATTITUDE_EID = c("trust_authority5", "-trust_authority6", "Statement1","statement2"),
                        SELF_ASSESMENT = c("statement3", "-statement4", "statement5", "-statement6")
)


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
  select(-starts_with("statement", ignore.case = F))

View(data)

saveRDS(data, "data/Smart Identification2.rds")
