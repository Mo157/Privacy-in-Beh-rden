# Privacy-in-Beh-rden - Vorstellung

Nutzungsbereitschaft des elektronischen Ausweises


Wir gehören zur Gruppe "Smartidentification" und haben das Thema "Privacy in Behörden". Zu diesem Thema wollen wir uns mit dem elektronischen Ausweisen beschäftigen (eID).

Teammitglieder

Julia Arndt
Morena Blaijc
Anna Leblanc
Bianca Nießen
Arlinda Ujkani

# Forschungsfrage

Welche Nutzerfaktoren beeinflussen die Nutzungsbereitschaft einer electronic Identity Card (eID)? 


# Literaturrecherche

Die Ergebnisse der Literaturrecherche zum Thema "Electronic Identity Card" wurden in einer Excel-Liste gesammelt.

Hier eine Zusammenstellung der wichtigsten drei Quellen:


# Faktorenraum 1.0

<<<<<<< HEAD
Dazu haben wir bereits einen Faktorenraum erstellt.


Der erste Faktorenraum ist mit Absicht sehr weit gefasst. Er deckt verschiedene Faktoren hab, die allgemein die Nutzung eines elektronischen Ausweises von Seiten verschiedener Parteien beeinflussen könnten. Neben dem Nutzer wird auch die Behörde als Fakor berücksichtigt.


![tooltip](Images/Faktorenraum.png) 

# Faktorenraum 1.1

Die aktualisierte Version des Faktorenraums berücksichtigt, dass nur Faktoren auf Seiten der Nutzer erhoben werden, da im weiteren Verlauf keine Befragung von Behörden stattfinden wird. Außerdem unterscheidet sie zwischen Nutzerfaktoren (blau) und der abhängigen Variable, der Nutzung des Ausweises (rot). Besonderes wichtige Nutzerfaktoren sind grün markiert. Noch nicht klar entschieden ist, ob die verschiedenen Eigenschaften des Ausweises auch einen Faktor darstellen, oder ob nur mit Eigenschaften des deutschen elektronischen Ausweises gearbeitet wird, dieser faktor also konstant bleibt.

![tooltip](Images/Faktorenraum_V2.png) 


# Fragebogen

Nun haben wir unseren Fragebogen auf Survey Monkey gegliedert und bei dem Demografischen Daten schon Fragen formuliert. Im nächsten Schritt wird jeder aus der Gruppe sich zu einem Gliederungsfaktor Fragen und die Art der Antwortmöglichkeit überlegen. Die Aufteilung folgt. 
<<<<<<< HEAD
>>>>>>> 59c0097361edefb6e4651d825e679500f31ff279
=======


# Forschungsstand 30.11.2018 - Entwicklung der ersten drei Hypothesen:

Hypothese 1:

Personen mit höherer Technikakzeptanz nutzen haeufiger bereits die eID/beabsichtigen häufiger, sie in nächster Zeit zu nutzen.


H1:Personen, die eine aktivierte eID haben, weisen eine höhere Technikakzeptanz auf als Personen mit nicht aktivierter eID.

H0: Es gibt keinen Unterschied in der Technikakzeptanz zwischen Personen mit aktivierter eID und Personen mit nicht aktivierter eID.

Hypothese 2:

Personen mit hoehererm Wissensstand über die eID haben eine positivere Haltung gegenueber der eID.

(Kommentar: Da wir beides in Skalen erfassen, handelt es sich hierbei um eine Zusammenhangy-Hypothese. Für den T-Test ist sie nicht geeignet.)

H2: Besitzer einer aktivierten eID haben ein höheres Wissen über die eID, als Besitzer einer nicht aktivierten eID.

H0: Es gibt keinen Unterschied im Wissensstand über die eID zwischen Personen mit aktivierter und Personen mit nicht aktivierter eID.

Hypothese 3: 

Personen, die nicht zentral in einer Stadt leben, sind eher dazu bereit, die eID zu nutzen.

--> H3: Personen, die auf dem Land leben, beabsichtigen stärker die eID in nächster Zeit zu nutzen, als Personen, die zentral in einer Stadt wohnen.

H0: Es gibt keinen Unterschied in der Absicht in nächster Zeit eine eID zu nutzen zwischen Personen mit aktivierter und Personen mit nicht aktivierter eID.


# Forschungsstand 07.12.18 - Ausführung des t-Test


H1:
t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze")$DIG_TECH)


H2: 
t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUE_FALSE,filter(data, which_eID== "Einen eID-fähigen, dessen Funktion ich auch nutze.")$TRUE_FALSE)


H3: 
t.test(filter(data, residence== "Ich wohne auf dem Land.")$Statement1,filter(data, residence== "Ich wohne zentral in einer Stadt.")$Statement1)



# Hinweise zum Umgang mit P-Values.


Der P-Wert (in R p-value) beschreibt eine Wahrscheinlichkeit. Das gängige Signifikanzniveau beträgt p=0.05. Das bedeutet, dass bei p > 0.05 wird die H0 behalten und bei p < 0.05 wird diese zugunsten der H1 verworfen. Wichtig ist, dass der P-Wert nicht direkt die Wahrscheinlichkeit für einen Alphafehler ist, sondern die Wahrscheinlichkeit für unsere Daten (oder extremere), wenn die H0 wahr ist. Dennoch hat der P-Wert eine hohe Relevanz, da er immer eine Aussage über die Daten trifft, jedoch nicht über den Wahrheitsgehalt der entworfenen Hypothesen. Er liefert also eine erste Antwort auf die Fragen: Wie gut „passen“ unsere Daten zur Nullhypothese? vs. Wie wahrscheinlich ist die Richtigkeit der Alternativhypothese?.

Für weitere Infos eignen sich folgende Quellen:

http://www.perfendo.org/docs/BayesProbability/twelvePvaluemisconceptions.pdf

http://blog.minitab.com/blog/adventures-in-statistics-2/not-all-p-values-are-created-equal
<<<<<<< HEAD
>>>>>>> 0a88476d356c5a7526fc63c530a5631eb05de6c4
=======


# Forschungsstand 21.12.2018 - Drei Zusammenhangshypothesen + dazugehörige Nullhypothese

1. Zusammenhangshypothese - KUT und DIG_TECH

Hypothese: Je höherer der KUT, desto höher der DIG_TECH
H0: Es gibt keinen Zusammenhang zwischen KUT und DIG_TECH

--> Berechnung des Korrelationskoeffizienten nach Spearman (da Vorraussetzung für Pearson Korrelation noch nicht prüfbar sind):


cor.test (KUT,DIG_TECH, method ="spearman")


2. Zusammenhangshypothese - AGE und USE_TECH

Hypothese: Je älter der Mensch, desto niedriger der USE_TECH
H0: Es gibt keinen Zusammenhang zwischen AGE und USE_TECH

--> Berechnung des Korrelationskoeffizienten nach Spearman (da Vorraussetzung für Pearson Korrelation noch nicht prüfbar sind):


cor.test (AGE,DIG_TECH, method ="spearman")


3. Zusammenhangshypothese - TRUST_TECH und TRUST_AUTHORITY

Hypothese: Je mehr man Technologien vertraut, desto eher vertraut man Behörden
H0: Es gibt keinen Zusammenhang zwischen TRUST_TECH und TRUST_AUTHORITY

--> Berechnung des Korrelationskoeffizienten nach Spearman (da Vorraussetzung für Pearson Korrelation noch nicht prüfbar sind):


cor.test (TRUST_TECH,TRUST_AUTHORITY, method ="spearman")


# Forschungsstand 09.01.2019 - Datenerhebung

Wir haben am 07.01.2019 unsere Befragung erfolgreich abgeschlossen. 

# Ergebnisse 

