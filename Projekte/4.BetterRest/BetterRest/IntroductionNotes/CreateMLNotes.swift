//
//  CreateMLNotes.swift
//  BetterRest
//
//  Created by Phil Seißelberg on 01.06.24.
//

import Foundation

/* Notes zu CreateML
 
 - On-device ML auf Apple Plattformen sehr einfach: CoreML + CreateML
 - CoreML ermöglicht das Einbauen von ML Funktionen in eine App
    - ermöglicht eine Vielzahl von Trainingsarten, u.a. Bilderkennung, Geräuscherkennung oder Bewegunserkennung
 - CreateML ermöglicht das Erzeugen eigener Modelle
 - ML erfolgt in 2 Schritten:
    - Modell trainieren
    - Vorhersagen abfragen
 
 - Abfolge für das BetterRestModell
    - CreateML öffnen
    - Tabular Regression Template verwenden
    - Datenquelle unter Data -> Training Data -> + importieren
    - Unter Target wird dann die Variable verwendet, welche in Zukunft vorhergesagt werden soll
    - Unter Features können die Vriablen angegeben werden, von dem die Vorhersagen abgeleitet werden sollen (eine oder mehrere angeben)
    - Unter Parameters kann dann der zu verwendende Algorithmus angegeben werden: Random Forest | Boosted Tree | Decision Tree | Linear Regression | Automatic
    - Training starten
 
    - Unter Evaluation -> Validation werden Parameter für den Erfolg des Modells bereitgestellt
    - In dem Fall Root Mean Square Error = 176.88 -> Ergebniss mit durchschnittlicher Abweichung von 176 Sekunden, also 3 Minuten, korrekt
    - Um diese Validation überhaupt durchführen zu können teilt CreateML die zum Training erhalten Daten zum Teil auf. Es wird also ein großer Teil zum Traing verwendet
      und für den Validation-Test am Ende ein kleiner Teil des Datensatzes zurückgehalten
    - Unter Output kann die Größe des Modells abgelesen werden -> in diesem Fall 539 Bytes (obwohl 180KB Daten als Input verwendet wurden)
    - Über den Get-Button kann das Modell für die spätere Verwendung abgespeichert werden
 
*/
