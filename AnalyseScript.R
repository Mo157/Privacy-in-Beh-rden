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

Drei Zusammenhangshypothesen + dazugehörige Nullhypothese

1: KUT und DIG_TECH
Hypothese: Je höherer der KUT, desto höher der DIG_TECH
H0: Es gibt keinen Zusammenhang zwischen KUT und DIG_TECH

## Unverbundener T-Test. UV: KUT, AV: DIG_TECH:

anova(data, dep = "dig_tech", factors = c("kut"))
#ANOVA. H1: DIG_TECH ist abhängig von KUT.

## Ergebnis: H0 verwerfen.

2: AGE und USE_TECH
Hypothese: Je älter der Mensch, desto niedriger der USE_TECH
H0: Es gibt keinen Zusammenhang zwischen AGE und USE_TECH

## Unverbundener T-Test. UV: AGE, AV: USE_TECH:

anova(data, dep = "use_tech", factors = c("age"))
#ANOVA. H1: USE_TECH ist abhängig von AGE.

## Ergebnis: H0 verwerfen.

3: TRUST_TECH und TRUST_AUTHORITY
Hypothese: Je mehr man Technologien vertraut, desto eher vertraut man Behörden
H0: Es gibt keinen Zusammenhang zwischen TRUST_TECH und TRUST_AUTHORITY

## Unverbundener T-Test. UV: TRUST_TECH, AV: TRUST_AUTHORITY:

anova(data, dep = "trust_authority", factors = c("trust_tech"))
#ANOVA. H1: TRUST_AUTHORITY ist abhängig von TRUST_TECH.

## Ergebnis: H0 verwerfen.

>>>>>>> 684925067597a5a3eb924b1e80481bfc611c3985