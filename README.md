# Privacy-in-Beh-rden

Nutzungsbereitschaft des elektronischen Ausweises


Wir gehören zur Gruppe "Smartidentification" und haben das Thema "Privacy in Behörden". Zu diesem Thema wollen wir uns mit dem elektronischen Ausweisen beschäftigen (eID).

Teammitglieder

Julia Arndt
Morena Blaijc
Anna Leblanc
Bianca Nießen
Arlinda Ujkani

Forschungsfrage

Welche Nutzerfaktoren beeinflussen die Nutzungsbereitschaft einer electronic Identity Card (eID)? 

<<<<<<< HEAD
Dazu haben wir bereits einen Faktorenraum erstellt ![tooltip](Images/Faktorenraum.png)
=======

Literaturrecherche

Die Ergebnisse der Literaturrecherche zum Thema "Electronic Identity Card" wurden in einer Excel-Liste gesammelt.

Faktorenraum

Der erste Faktorenraum ist mit Absicht sehr weit gefasst. Er deckt verschiedene Faktoren hab, die allgemein die Nutzung eines elektronischen Ausweises von Seiten verschiedener Parteien beeinflussen könnten. Neben dem Nutzer wird auch die Behörde als Fakor berücksichtigt.


![tooltip](Images/Faktorenraum.png) 


Die aktualisierte Version des Faktorenraums berücksichtigt, dass nur Faktoren auf Seiten der Nutzer erhoben werden, da im weiteren Verlauf keine Befragung von Behörden stattfinden wird. Außerdem unterscheidet sie zwischen Nutzerfaktoren (blau) und der abhängigen Variable, der Nutzung des Ausweises (rot). Besonderes wichtige Nutzerfaktoren sind grün markiert. Noch nicht klar entschieden ist, ob die verschiedenen Eigenschaften des Ausweises auch einen Faktor darstellen, oder ob nur mit Eigenschaften des deutschen elektronischen Ausweises gearbeitet wird, dieser faktor also konstant bleibt.

![tooltip](Images/Faktorenraum_V2.png) 


Fragebogen

Nun haben wir unseren Fragebogen auf Survey Monkey gegliedert und bei dem Demografischen Daten schon Fragen formuliert. Im nächsten Schritt wird jeder aus der Gruppe sich zu einem Gliederungsfaktor Fragen und die Art der Antwortmöglichkeit überlegen. Die Aufteilung folgt. 
<<<<<<< HEAD
>>>>>>> 59c0097361edefb6e4651d825e679500f31ff279
=======

Ich (Anna) habe nun Fragen und Antwortmöglichkeiten zu den Demografischen Daten und zur Nutzung anderer Technologien erstellt. Sie sind mit Sicherheit noch nicht perfekt, aber eine Grundlage auf die wir aufbauen können. Kritik, Verbesserungevorschläge und Ergänzungen werden gerne gehört ;-)

Ich (Arlinda) habe ein Google Dokument erstellt, damit wir erst einmal alle unsere Fragen sammeln können, und auch schon einige Fragen sowie ein Bespielszeanriotext erstellt.



Frage 17 bis 22 wurden auf Surveymonkey zu einer Frage mit drei Items zusammengefasst (Arlinda)

Frage 9 wurde bearbeitet: Vorschlagformulierung von Herrn Hildebrandt wurde übernommen (Arlinda) 

Es wurde der Szenarientext angepasst (Julia).

Es wurde das Wissen über den e-Ausweis operationaliert: Frage 12 (Julia).

Es wurde die Reihenfolge der Fragen angepasst und Fragen zu UV auf die Fragebogenseite "Nutzerfaktoren" verschoben (Julia).

Frage 14 und 15 wurde die Skala angepasst von einer Zustimmungsmatrix zu einer Multiple-Choice Frage. (Julia)

Es wurde bei Frage 16 und 18 Vorschläge zur Löschung von Items eingefügt (Julia).

Es wurde Vorgeschlagen Frage 11 zu löschen (Julia).

Kommentar: Es konnte nicht gelöscht, sondern nur ausgeblendet werden. Das muss beim Datecleaning beachtet werden (Julia).

Hausaufgabe fuer den 30.11.2018 - drei Hypothesen:

1. Personen mit höherer Technikakzeptanz nutzen haeufiger bereits die eID/beabsichtigen häufiger, sie in nächster Zeit zu nutzen.


Kommentar (Julia): Da wir verschiedene Personalausweistypen abfragen, wäre dies eigentlich eine Unterschiedshypothese für eine ANOVA. Für die Hausaufgabe mit dem T-Test können wir jedoch zwei ausweistypen vergleichen.

--> H1:Personen, die eine aktivierte eID haben, weisen eine höhere Technikakzeptanz auf als Personen mit nicht aktivierter eID.

H0: Es gibt keinen Unterschied in der Technikakzeptanz zwischen Personen mit aktivierter eID und Personen mit nicht aktivierter eID.

2. Personen mit hoehererm Wissensstand über die eID haben eine positivere Haltung gegenueber der eID.

Kommentar (Julia): Da wir beides in Skalen erfassen, handelt es sich hierbei um eine Zusammenhangy-Hypothese. Für den T-Test ist sie nicht geeignet.

--> H2: Besitzer einer aktivierten eID haben ein höheres Wissen über die eID, als Besitzer einer nicht aktivierten eID.

H0: Es gibt keinen Unterschied im Wissensstand über die eID zwischen Personen mit aktivierter und Personen mit nicht aktivierter eID.

3. Personen, die nicht zentral in einer Stadt leben, sind eher dazu bereit, die eID zu nutzen.

--> H3: Personen, die auf dem Land leben, beabsichtigen stärker die eID in nächster Zeit zu nutzen, als Personen, die zentral in einer Stadt wohnen.

H0: Es gibt keinen Unterschied in der Absicht in nächster Zeit eine eID zu nutzen zwischen Personen mit aktivierter und Personen mit nicht aktivierter eID.

# Notiz für Aufgabe 3 der Hausaufgabe (07.12.18)

Einfach: t.test(data$TROST_HUMAN, mu=2.5) 

Unverbunden t.test(filter(data, gender== "männlich")$KUT, filter(data, gender== "weiblich")$KUT) oder t.test(data$kut~ data$gender)

Verbunden t.test(data$TROST_HUMAN, data$TROST_ROBOT, paired= TRUE)



Kommentar Julia für Anna: 
Bei H1: statt gender --> which_eID und statt KUT --> DIG_TECH
Bei H2: statt gender --> which_eID und statt KUT --> TRUE_FALSE
Bei H3: statt gender --> residence und statt KUT --> Statement1

Einen eID-fähigen, dessen Funktion ich auch nutze.

# R Code zur Überprüfung der 3 Hypothesen mit T-Test (Schreibe es auch in das Analyse Skript)

H1:
t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH,filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$DIG_TECH)


H2: 
t.test(filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUE_FALSE,filter(data, which_eID== "Einen eID-fähigen, die Funktion ist aber deaktiviert.")$TRUE_FALSE)


H3: 
t.test(filter(data, residence== "Ich wohne auf dem Land.")$Statement1,filter(data, residence== "Ich wohne zentral in einer Stadt.")$Statement1)

t.test(filter(data, residence)$Statement1)

Hinweise zum Umgang mit P-Values.

Der P-Wert (in R p-value) wird auch Signifikanzniveau genannt. Das gängige Signifikanzniveau beträgt 5%. Das bedeutet, dass bei p > 5% wird die H0 behalten und bei p < 5% wird diese zugunsten der H1 verworfen. Bei uns würde das bedeuten, dass man beispielsweise bei einem Signifikanzniveau von p > 5% statt der H1 („Personen, die eine aktivierte eID haben, weisen eine höhere Technikakzeptanz auf als Personen mit nicht aktivierter eID.“) die entsprechende H0 („Es gibt keinen Unterschied in der Technikakzeptanz zwischen Personen mit aktivierter eID und Personen mit nicht aktivierter eID“) verwendet wird. Ist das Signifikanzniveau bei p < 5% wäre es genau umgekehrt. Wichtig ist, dass der P-Wert nicht direkt die Wahrscheinlichkeit für einen Alphafehler ist, sondern die Wahrscheinlichkeit für unsere Daten (oder extremere), wenn die H0 wahr ist. Dennoch hat der P-Wert eine hohe Relevanz, da er immer eine Aussage über die Daten trifft, jedoch nicht über den Wahrheitsgehalt der entworfenen Hypothesen.
Für weitere Infos eignen sich die folgenden Quellen:
http://www.perfendo.org/docs/BayesProbability/twelvePvaluemisconceptions.pdf
http://blog.minitab.com/blog/adventures-in-statistics-2/not-all-p-values-are-created-equal
<<<<<<< HEAD
>>>>>>> 0a88476d356c5a7526fc63c530a5631eb05de6c4
=======


### Hausaufgabe für den 21.12.2018

Drei Zusammenhangshypothesen + dazugehörige Nullhypothese

1: KUT und DIG_TECH
Hypothese: Je höherer der KUT, desto höher der DIG_TECH
H0: Es gibt keinen Zusammenhang zwischen KUT und DIG_TECH

## Unverbundener T-Test. UV: KUT, AV: DIG_TECH:

t.test( filter(data_robot, gender == "weiblich")$kut, 

        filter(data_robot, gender == "männlich")$kut )

## Ergebnis: H0 verwerfen.

2: AGE und USE_TECH
Hypothese: Je älter der Mensch, desto niedriger der USE_TECH
H0: Es gibt keinen Zusammenhang zwischen AGE und USE_TECH

## Unverbundener T-Test. UV: AGE, AV: USE_TECH:

t.test( filter(data_robot, gender == "weiblich")$kut, 

        filter(data_robot, gender == "männlich")$kut )

## Ergebnis: H0 verwerfen.

3: TRUST_TECH und TRUST_AUTHORITY
Hypothese: Je mehr man Technologien vertraut, desto eher vertraut man Behörden
H0: Es gibt keinen Zusammenhang zwischen TRUST_TECH und TRUST_AUTHORITY

## Unverbundener T-Test. UV: TRUST_TECH, AV: TRUST_AUTHORITY:

t.test( filter(data_robot, gender == "weiblich")$kut, 

        filter(data_robot, gender == "männlich")$kut )

## Ergebnis: H0 verwerfen.

>>>>>>> 684925067597a5a3eb924b1e80481bfc611c3985



