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