install.packages("scales")

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
library(scales)


devtools::install_github("HCIC/r-tools")

source("surveymonkey.R")


#### Datei laden ----

data <- readRDS("data/Smart Identification2.rds")

View(data)

# Deskriptive Statistik EID



table(data$which_eID)

t.test()

ls()

group <- c("aktivierte eID",  "keine Ahnung", "alter Ausweis", "deaktivierte eID")
value_eID <- c(7.3, 14.7, 20.9, 57.1)

dfplot <- data.frame(group <- c("aktivierte eID",  "keine Ahnung", "alter Ausweis", "deaktivierte eID"),
                     value_eID <- c(7.3, 14.7, 20.9, 57.1)
                     )

bp<- ggplot(dfplot, aes(x="", y=value_eID, fill=group))+
  geom_bar(width = 1, stat = "identity")


pie <- bp + coord_polar("y", start=0) 

pie

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )

pie2 <- pie + geom_text(aes(y = value_eID/3 + c(0, cumsum(value_eID)[-length(value_eID)]), 
                            label = percent(value_eID/100)), size=5)

pie2

pie3 <- pie + geom_text(aes(y = value_eID/6 + c(0, cumsum(value_eID)[-length(value_eID)]), 
                            label = percent(value_eID/100)), size=5)

pie3


# Pie Chart with Percentages
slices <- c(7.3, 14.7, 20.9, 57.1)
lbls <- c("aktivierte eID",  "keine Ahnung", "alter Ausweis", "deaktivierte eID")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Kuchendiagramm der vertetenen Ausweistypen in der Stichprobe")

ggsave("Ausweistypen.pdf", width = 8.5, height = 5)
library(ggplot2)

ggplot(data = data) +
  aes(x = which_eID) +
  geom_bar(fill = "#0c4c8a") +
  labs(title = "Die eID liegt häufiger deaktiviert als aktiviert vor",
    x = "Art des Ausweises",
    y = "absolute Häufigkeit",
    subtitle = "Säulendiagramm: Absolute Häufigkeiten der verschiedenen Ausweistypen") +
  theme_grey()

ggsave("Ausweistypen.pdf", width = 8.5, height = 5)



describe(data$ATTITUDE_EID)

##Einstellung eID----

describe(data$ATTITUDE_EID)

table(data$gender)
table (data$education)

describe(data$KUT)
describe(data$age)

library(ggplot2)

ggplot(data = data) +
  aes(x = ATTITUDE_EID) +
  geom_histogram(bins = 12, fill = "#0c4c8a") +
  labs(title = "Die Einstellung zur eID zeigt eine Verteilung um die Mitte der Skala",
    x = " Einstellung zur eID von negativ zu positiv [1-6]",
    y = "absolute Häufigkeit",
    subtitle = "Histogramm: absolute Häufigkeiten der Mittelwerte Einstellung zur eID") +
  theme_gray()
ggsave("Einstellung.pdf", width = 8.5, height = 5)


#Korrelationen ATTITUDE_EID und folgende Lineare Regression

jmv::corrMatrix(data, vars = c( "age", "KUT", "DIG_TECH", "TRUST_TECH", "TRUST_AUTHORITY", "DATA_PRIVACY", "ATTITUDE_EID", "SELF_ASSESMENT"))


jmv::linReg(data, dep= "ATTITUDE_EID", covs = c (  "DIG_TECH", "TRUST_AUTHORITY", "SELF_ASSESMENT"), 
            blocks = c ( "DIG_TECH", "TRUST_AUTHORITY", "SELF_ASSESMENT"),
            stdEst = TRUE, qqPlot = TRUE, collin = TRUE, anova = TRUE)

jmv::linReg(data, dep= "ATTITUDE_EID", covs = c (  "DIG_TECH"), 
            blocks = c ( "DIG_TECH"),
            stdEst = TRUE, qqPlot = TRUE, collin = TRUE)

lm(data$ATTITUDE_EID ~ data$DIG_TECH)

plot(data$ATTITUDE_EID, data$DIG_TECH, pch = 16, cex = 1.3, col = "blue", main = "ATTITUDE TOWARDS eID PLOTTED DIG_TECH", xlab = "ATTITUDE", ylab = "DIG_TECH", abline(1.18, 0.527))

reg1 <- lm(ATTITUDE_EID ~ DIG_TECH ,data=data) 
summary(reg1)

with(data,plot(ATTITUDE_EID, DIG_TECH))
abline(reg1)

library(ggplot2)

ggplot(data = data) +
  aes(x = ATTITUDE_EID, y = DIG_TECH) +
  geom_point(color = "#0c4c8a") +
  theme_grey() +
  geom_smooth(method = "lm", se = FALSE) +
  xlim(1,6)+
  ylim(1,6) +
  scale_x_continuous(breaks=c(1, 2, 3, 4, 5, 6)) +
 
  ggsave("test.pdf", width = 7, height = 4)
  

ggplot(data = data) +
  aes(x = ATTITUDE_EID, y = DIG_TECH) +
  geom_point(color = "#0c4c8a") +
  theme_grey() +
  geom_smooth(method = "lm", se = FALSE) +
  xlim(1,6)+
  ylim(1,6) +
  scale_x_continuous(breaks=c(1, 2, 3, 4, 5, 6)) +
  geom_abline(reg1) 

ggsave("test", width = 7, height = 4)

describe(data$DIG_TECH)



#Unterschiede zwischen Gruppen

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DIG_TECH)




#-- ZUerst:Untersuchung der Varianz und Normalverteilung

table(data$which_eID)

data_a <- subset(data, data$which_eID == "Einen eID-fähigen, die Funktion ist aber deaktiviert.")

data_b <- subset(data, data$which_eID == "Einen eID-fähigen, dessen Funktion ich auch nutze.")



t.test(data_a$KUT, data_b$KUT)

t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$KUT,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$KUT)


t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,
       filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$DIG_TECH)


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