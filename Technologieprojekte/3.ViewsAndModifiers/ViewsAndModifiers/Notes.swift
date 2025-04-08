//
//  Notes.swift
//  ViewsAndModifiers
//
//  Created by Phil Seißelberg on 30.05.24.
//

/*
 
 
 UIKit/AppKit verwendet Klassen für Views, SwiftUI verwendet Structs da
 - Bessere Performance: Strukturen sind einfacher und schneller als Klassen. Die Verwendung von Strukturen ist jedoch nur ein Teilgrund für die gute Performance von SwiftUI.
 - Keine Vererbungsüberlastung: In UIKit leitet sich jede View von UIView ab und muss deshalb unzählige Eigenschaften und Methoden mitschleppen (Vererbung).
 - Strukturierter: UIKit erlaubt beliebige Änderungen an Werten zu jeder Zeit, was zu unaufgeräumtem Code führt. SwiftUI fordert dazu auf, funktionaler zu arbeiten und am Ende kleinere Views zu haben.



 View-Hintergrund
 - Der background-Modifier auf ein View-Objekt färbt immer nur dessen Hintergrund ein, der “hintere” weiße Hintergrund ist nicht ansprechbar.
 - Daher muss für den App-Hintergrund immer eine Hintergrund-View mit ZStack verwendet werden.
 - Für SwiftUI-Entwickler ist praktisch “nichts hinter einer View” (technich liegt hinter der View der UIHostingController, welcher eine Brücke zwischen UIKit und SwiftUI bildet)



 frame(maxWidth:maxHeight:)
 - erlaubt es, eine maximale Größe für die View anzugeben, welche aber nicht verwendet werden muss.
 - die tatsächlich verwendete Größe wird geschrumpft, falls andere Views ebenfalls Platz benötigen.



 some View
 - Opaque-Typ, gibt einen Typ an, der zum View-Protokoll konform ist.
 – Die Verwendung von „View“ allein wäre nicht möglich. Enthält die „body“-Eigenschaft beispielsweise nur eine Text-View, müsste „: Text“ angegeben werden, sofern die „some-View“-Lösung nicht verfügbar wäre.
 – Der Typ von „VStack“, der zwei weitere Views enthält, ist im Hintergrund eine „TupleView“ (diese erweitert sich dann für mehr Views).
 - Befinden sich in der body-Eigenschaft mehrere Views, die jedoch nicht gestapelt sind, … sind =>Markieren Sie eine Ansicht mit dem Attribut `@ViewBuilder`.




 Das Attribut @ViewBuilder verpackt mehrere Ansichten in einem TupleView-Container.

 Environment-Modifikatoren
 - Ein Modifikator wird auf mehrere Ansichten gleichzeitig angewendet, beispielsweise auf einen Stack mit Ansichten.
 - Erhält eine der enthaltenen Ansichten einen eigenen Modifikator, überschreibt dieser den Environment-Modifikator (für diese eine Ansicht).
   Es gibt jedoch Ausnahmen, beispielsweise bei `.blur` (siehe Dokumentation, ob Benennung vorhanden: Regulärer oder Environment-Modifikator).

 
 */

