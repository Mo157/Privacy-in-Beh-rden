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


Literaturrecherche

Die Ergebnisse der Literaturrecherche zum Thema "Electronic Identity Card" wurden in einer Excel-Liste gesammelt.

Faktorenraum

Der erste Faktorenraum ist mit Absicht sehr weit gefasst. Er deckt verschiedene Faktoren hab, die allgemein die Nutzung eines elektronischen Ausweises von Seiten verschiedener Parteien beeinflussen könnten. Neben dem Nutzer wird auch die Behörde als Fakor berücksichtigt.


![tooltip](Images/Faktorenraum.png) 


Die aktualisierte Version des Faktorenraums berücksichtigt, dass nur Faktoren auf Seiten der Nutzer erhoben werden, da im weiteren Verlauf keine Befragung von Behörden stattfinden wird. Außerdem unterscheidet sie zwischen Nutzerfaktoren (blau) und der abhängigen Variable, der Nutzung des Ausweises (rot). Besonderes wichtige Nutzerfaktoren sind grün markiert. Noch nicht klar entschieden ist, ob die verschiedenen Eigenschaften des Ausweises auch einen Faktor darstellen, oder ob nur mit Eigenschaften des deutschen elektronischen Ausweises gearbeitet wird, dieser faktor also konstant bleibt.

![tooltip](Images/Faktorenraum_V2.png) 


Fragebogen

Nun haben wir unseren Fragebogen auf Survey Monkey gegliedert und bei dem Demografischen Daten schon Fragen formuliert. Im nächsten Schritt wird jeder aus der Gruppe sich zu einem Gliederungsfaktor Fragen und die Art der Antwortmöglichkeit überlegen. Die Aufteilung folgt. 

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