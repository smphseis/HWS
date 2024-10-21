//
//  Notes.swift
//  ViewsAndModifiers
//
//  Created by Phil Seißelberg on 30.05.24.
//

import Foundation

/* Notes
- UIKit/AppKit verwenden class für Views, SwiftUI verwendet structs
  Gründe:
    - Trägt zur besserer Performance bei, da structs sind einfacher und schneller als Klassen sind. Allerdings ist die Verwenung von
      structs nur ein Teilgrund für die gute Performance für SwiftUI
    - Keine Vererbungsüberlast: In UIKit leitet sich jede View von UIView ab und muss deshalb unzählige Properties und Methoden
      mitschleppen(Vererbung)
    - Strukturierter: UIKit erlaubt beliebige Änderungen an Werten zu jeder Zeit -> Unaufgeräumter Code. SwiftUI fordert den
      Entwickler auf, funktionaler zu arbeiten und am Ende clenere Views basierend auf States zu haben

- View-Hintergrund
    - background-Modifier auf ein View-Objekt färbt immer nur dessen Hintergrund ein, der "hintere" weiße Hintergrund ist nicht ansprechbar
    - daher muss für App-Hintergrund immer einer Hintergrund-View mit ZStack verwendet werden
    - Für SwiftUI-Entwickler ist "nichts hinter einer View" (wobei dies nicht ganz stimmt)
    - tatsächlich ist hinter der View der UIHostingController, welcher eine Brücke zwischen UIKit und SwiftUI bildet
    
 - frame(maxWidth:maxHeight:) erlaubt es eine maximale Größe für die View anzugeben, welche aber nicht verwendet werden muss
   Stattdessen wird die tatsächlich verwendete Größe geschrumpft, falls andere Views ebenfalls Platz brauchen
 
 - some View:
    - Opaque-Type, gibt einen Typ an der zu View konform ist
    - nur View wäre nicht möglich, besteht die body-Property beispielsweise nur aus einer Text-View müsste : Text angegeben werden, falls es
      nicht die "some-View"-Lösung gäbe
    - der Typ von VStack der 2 weitere Views enthält ist im Hintergrund eine TupleView(diese erweitert sich dann für mehr Views)
    - befinden sich in der body-Property mehrere Views, welche aber nicht gestackt sind => view-Property mit @ViewBuilder markieren
 
 - @ViewBuilder
    - packt mehrere Views in einen TupleView-Container
 
 - Bedingte Modifier
    - mehrere View-Varianten in if/else stecken
        - eher ineffektiv, da Zerstörung einer View bei Anzeige einer anderen
    - Ternary-Operator im Operator direkt
 
 - Environment Modifier
    - ein Modifier auf meherern Views gleichzeitig angewandt, beispielsweise Modifier auf Stack mit Views angewandt
    - bekommt einer den enthaltenden Views einen eigenen Modifier überschreibt dieser den Environment Modifier (für diese eine View)
      Es gibt aber Ausnahmen, beispielsweise .blur (siehe in Doc ob Bennung vorhanden: Regulärer oder Environment Modifier)
 
*/

