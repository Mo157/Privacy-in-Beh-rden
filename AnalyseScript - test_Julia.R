# Analyse Script
print("Hier werden Pakete eingebunden")

# Data Cleaning ----
print("Hier wird der Datensatz aufbereitet. Thema am 09.11.2018")

# Skalenberechnung ----
print("Hier werden später Skalen berechnet. Thema am 09.11.2018")

# Analyse ----
print("Hier werden später statistische Analysen durchgeführt. Thema ab dem 16.11.2018")

# Graphik erstellung ----
print("Hier werden später Grafiken erstellt. Thema ab dem 16.11.2018")

### Hausaufgabe für den 21.12.2018

# Data Cleaning Dummydatensatz

#### Bibliotheken laden

#install.packages("tidyverse")
#install.packages("lubridate")
#install.packages("psych")
#install.packages("esquisse")
#install.packages("ggthemes")
#install.packages("ggplot2")
#install.packages("devtools")
#install.packages("jmv")
#install.packages("scales")



install.packages("tidyverse")
install.packages("lubridate")
install.packages("psych")
install.packages("esquisse")
install.packages("ggthemes")
install.packages("ggplot2")
install.packages("devtools")
install.packages("jmv")
install.packages("scales")


library(tidyverse)
library(lubridate)
library(psych)
library(esquisse)
library(ggthemes)
library(ggplot2)
library(devtools)
library(jmv)
library(scales)

devtools::install_github("HCIC/r-tools")

source("surveymonkey.R")


#### Datei laden ----

filename <- "data/SmartIdentification.csv"
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

#Dummys entfernen

raw.short[ ! ( ( raw.short$age != 99) ) , ]

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

scale.zustimmungklein <-c("stimme gar nicht zu", 
                          "stimme nicht zu", 
                          "stimme eher nicht zu", 
                          "stimme eher zu", 
                          "stimme zu", 
                          "stimme völlig zu")


# Likert-Items zu ordinalen levels machen:

raw.short$kut1 <- ordered(raw.short$kut1, levels = scale.zustimmung)
raw.short$kut2 <- ordered(raw.short$kut2, levels = scale.zustimmung)
raw.short$kut3 <- ordered(raw.short$kut3, levels = scale.zustimmung)
raw.short$kut4 <- ordered(raw.short$kut4, levels = scale.zustimmung)
raw.short$kut5 <- ordered(raw.short$kut5, levels = scale.zustimmung)
raw.short$kut6 <- ordered(raw.short$kut6, levels = scale.zustimmung)
raw.short$kut7 <- ordered(raw.short$kut7, levels = scale.zustimmung)
raw.short$kut8 <- ordered(raw.short$kut8, levels = scale.zustimmung)

raw.short$privacy1 <- ordered(raw.short$privacy1, levels = scale.zustimmungklein)
raw.short$privacy2 <- ordered(raw.short$privacy2, levels = scale.zustimmungklein)
raw.short$privacy3 <- ordered(raw.short$privacy3, levels = scale.zustimmungklein)

raw.short$data_protec1 <- ordered(raw.short$data_protec1, levels = scale.zustimmungklein)
raw.short$data_protec2 <- ordered(raw.short$data_protec2, levels = scale.zustimmungklein)
raw.short$data_protec3 <- ordered(raw.short$data_protec3, levels = scale.zustimmungklein)

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

schluesselliste <- list(KUT= c("kut1", "-kut2", "kut3", "kut4", "-kut5", "kut6", "kut7", "-kut8"),
                        PRIVACY= c("privacy1", "privacy2", "-privacy3"),
                        DATA_PROTEC= c("data_protec1", "data_protec2", "-data_protec3"),
                        BUY_TECH= c("buy_tech1", "buy_tech2", "buy_tech3", "buy_tech4", "buy_tech5", "buy_tech6"),
                        TRUST_TECH= c("trust_tech1", "trust_tech2", "trust_tech3", "trust_tech4", "trust_tech5", "-trust_tech6"),
                        DIG_TECH= c("dig_tech1", "-dig_tech2", "dig_tech3", "dig_tech4", "dig_tech5", "-dig_tech6", "dig_tech7", "dig_tech8"),
                        TRUE_FALSE= c("true_false1", "true_false2", "-true_false3", "-true_false4", "true_false5", "-true_false6"),
                        TRUST_AUTHORITY= c("trust_authority1", "trust_authority2", "-trust_authority3", "-trust_authority4", "-trust_authority7"),
                        ATTITUDE_EID = c("trust_authority5", "-trust_authority6", "Statement1","statement2"),
                        SELF_ASSESMENT = c("statement3", "-statement4", "statement5", "-statement6"),
                        DATA_PRIVACY = c("privacy1", "privacy2", "-privacy3","data_protec1", "data_protec2", "-data_protec3"),
                        TRUE_S = c("true_false1", "true_false2","true_false5"),
                        FALSE_S= c("true_false3", "true_false4","true_false6"),
                        ORIGINAL_AU =c("trust_authority1", "trust_authority2", "-trust_authority3", "-trust_authority4","trust_authority5", "-trust_authority6", "-trust_authority7"),
                        ORIGINAL_EID = c("Statement1","statement2","statement3", "-statement4", "statement5", "-statement6")
)


scores <- scoreItems(schluesselliste, raw.short, missing = TRUE, min = 1, max = 6)


# Skalen prüfen
scores$alpha




data <- bind_cols(raw.short, as.tibble(scores$scores))  
data <- data %>% filter (age != 99)
data <- data %>% 
  select(-starts_with("kut", ignore.case = F)) %>% 
  select(-starts_with("privacy", ignore.case = F)) %>%
  select(-starts_with("data_protec", ignore.case = F)) %>%
  select(-starts_with("buy_tech", ignore.case = F)) %>%
  select(-starts_with("trust_tech", ignore.case = F)) %>%
  select(-starts_with("dig_tech", ignore.case = F)) %>%
 # select(-starts_with("true_false", ignore.case = F)) %>%
  select(-starts_with("trust_authority", ignore.case = F)) %>% 
  select(-starts_with("statement", ignore.case = F))

View(data)

table(data$true_false1)
table(data$true_false2)
table(data$true_false3)
table(data$true_false4)
table(data$true_false5)
table(data$true_false6)

#saveRDS(data, "data/Smart Identification2.rds")


###### t-Test der 3 Unterschieds-Hypothesen

#1. Hypothese

# H1:Personen, die eine aktivierte eID haben, weisen eine höhere Technikakzeptanz auf als Personen mit nicht aktivierter eID.
#H0: Es gibt keinen Unterschied in der Technikakzeptanz zwischen Personen mit aktivierter eID und Personen mit nicht aktivierter eID.

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DIG_TECH)
## FEEDBACK: Der Code ist super! An der Formulierung stört mich aber ein bisschen, dass der Bezugspunkt der Technikakzeptanz nicht deutlich wird. Technikakzeptanz wovon?

#2. Hypothese

# H2:Besitzer einer aktivierten eID haben ein höheres Wissen über die eID, als Besitzer einer nicht aktivierten eID.
#H0: Es gibt keinen Unterschied im Wissensstand über die eID zwischen Personen mit aktivierter und Personen mit nicht aktivierter eID.

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUE_FALSE,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUE_FALSE)
## FEEDBACK: Super, funktioniet so!

# 3. Hypothese

#H3: Personen, die auf dem Land leben, beabsichtigen stärker die eID in nächster Zeit zu nutzen, als Personen, die zentral in einer Stadt wohnen.
#H0: Es gibt keinen Unterschied in der Absicht in nächster Zeit eine eID zu nutzen zwischen Personen die in der Stadt und Personen, die auf dem Land wohnen.

t.test(filter(data, residence== "Ich wohne auf dem Land.")$Statement1,
       filter(data, residence== "Ich wohne zentral in einer Stadt.")$Statement1)

## FEEDBACK: Bei der Nullhypothese stimmt was nicht... 
# Der Code ist für unser Seminar okay, für die Zukunft sei ihnen aber noch mitgegeben, dass einzelne Items eigentlich nicht mit T-Test untersucht werden. 
# Hier wäre der sogenannte Mann-Whitney-U-Test (kurz: U-Test) die richtige Methode. Der U-Test vergleicht genau zwei Gruppen hinsichtlich einer *ordinalen* Variable.
# Der U-Test kommt in der Vorlesung noch dran und ist in der Interpretation genau wie der T-Test. Hierfür schreiben Sie einfach oben wilcox.test() statt t.test().
# Können Sie ja mal ausprobieren, nur Mut :-)



### Hausaufgabe für den 21.12.2018

#Drei Zusammenhangshypothesen + dazugehörige Nullhypothese

#1. Hypothese KUT und DIG_TECH
#H1: Je höherer der KUT, desto höher der DIG_TECH
#H0: Es gibt keinen Zusammenhang zwischen KUT und DIG_TECH

## Berechnung des Korrelationskoeffizienten nach Spearman (da Vorraussetzung für Pearson Korrelation noch nicht prüfbar sind):


cor.test (data$KUT,data$DIG_TECH, method ="spearman", ci=TRUE)
## FEEDBACK: Super, genau so. 
## Ergebnis: (Warten auf Datenerhebung)

#2. Hypothese: AGE und DIG_TECH
#H2: Je älter der Mensch, desto niedriger der DIG_TECH
#H0: Es gibt keinen Zusammenhang zwischen AGE und DIG_TECH

## Berechnung des Korrelationskoeffizienten nach Spearman (da Vorraussetzung für Pearson Korrelation noch nicht prüfbar sind):


cor.test (data$AGE,data$DIG_TECH, method ="spearman", ci =TRUE)
## FEEDBACK: Funktioniert auch, das mit dem USE_TECH und DIG_TECH ist aber ein bisschen verwirrend. Das erste gibt es in ihren Daten gar nicht, oder?
## Ergebnis: (Warten auf Datenerhebung)

#3. Hypothese: TRUST_TECH und TRUST_AUTHORITY
#H3: Je mehr man Technologien vertraut, desto eher vertraut man Behörden
#H0: Es gibt keinen Zusammenhang zwischen TRUST_TECH und TRUST_AUTHORITY

## Berechnung des Korrelationskoeffizienten nach Spearman (da Vorraussetzung für Pearson Korrelation noch nicht prüfbar sind):


cor.test (data$TRUST_TECH,data$TRUST_AUTHORITY, method ="spearman", ci=TRUE)
## FEEDBACK: Das ist noch der Code von H2. Ich bin aber zuversichtlich, dass sie das hinbekommen hätten :-)
## Ergebnis: (Warten auf Datenerhebung)


describe(data$which_eID)

anova(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUE_FALSE,
      filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUE_FALSE,
      filter(data, which_eID== "Ich weiß es nicht.")$TRUE_FALSE,
      filter(data, which_eID== "Einen alten, der nicht eID-fähig ist.")$TRUE_FALSE)

jmv::corrMatrix(data, var = vars(KUT, DIG_TECH), ci =TRUE)


data %>% 
  group_by(which_eID) %>% 
  summarise(mean_kut = mean(KUT)) %>% 
  ggplot() +
  aes(x = which_eID, y = mean_kut, colour = which_eID, weight = mean_kut)


data %>% 
  ggplot()+
  aes(x = which_eID, y = KUT, colour = which_eID, weight = KUT)
  
library(ggplot2)

ggplot(data = data) +
  aes(x = which_eID, y = KUT) +
  geom_boxplot(fill = "#0c4c8a") +
  theme_minimal()


  