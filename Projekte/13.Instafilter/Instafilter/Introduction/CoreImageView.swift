//
//  CoreImageView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 17.10.24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageView: View {
    
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        //hole Bild aus dem Asset-Catalog
        let inputImage = UIImage(resource: .m4)
        
        //wandle für weitere Bearbeitung in CIImage um
        let beginImage = CIImage(image: inputImage)
        
        //Context konvertiert Bilddaten wieder in CIImage um
        let context = CIContext()
        
        //Filter anwenden:
        
        ///Sepia Effekt
        //Sepia ist simpler Filter -> nur 2 relevante Properties
        //inputImage = zu veränderndes Bild
        //intensity -> Effektstärke (0 = Originalbild, 1 = Voller Effekt)
        //let currentFilter = CIFilter.sepiaTone()
        //currentFilter.inputImage = beginImage
        //currentFilter.intensity = 1
        
        ///Pixel Effekt Filter
        //let currentFilter = CIFilter.pixellate()
        //currentFilter.inputImage = beginImage
        //currentFilter.scale = 100
        
        ///Crystallize
        //let currentFilter = CIFilter.crystallize()
        //currentFilter.inputImage = beginImage
        //currentFilter.radius = 200
        
        ///Twirl ("Verformt")
        //let currentFilter = CIFilter.twirlDistortion()
        //currentFilter.inputImage = beginImage
        //currentFilter.radius = 1000
        //currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage

        let amount = 1.0

        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }
        
        //Folgende 4 Schritte sind nötig, um verarbeitetetes Bild in SwiftUI Image umzuwandeln
        
        //hole CIImage aus outputImage des Filters
        guard let outputImage = currentFilter.outputImage else { return }
        
        //in CGImage umwandeln
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        //zu UIImage umwandeln
        let uiImage = UIImage(cgImage: cgImage)
        
        //in SwiftUI Image umwandeln
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    CoreImageView()
}

//4 verschiedene Image Views: Image, UIImage, CGImage, CIImage
    
    //Image
    //-> "Image-View" für SwiftUI
    //-> Endpunkt: dient eher der Anzeige von Bildern (keine Core Image-Verarbeitung)
    
    
    //UIImage
    //-> "Image-View" für UIKit
    //-> Arbeitet mit Vielzahl von Bildtypen wie beispielsweise Bitmaps (wie PNG), Vektoren (wie SNG) oder Bildsequenzen für Animationen


    //CGImage
    //-> Core Graphics
    //-> Simpler Bildtyp, einfaches 2D-Array von Pixeln


    //CIImage
    //-> Core Image
    //-> Speichert sämtliche Infos um Bild zu errechnen
    //-> Dient weniger der Darstellung des Bildes
    //-> Laut Apple eher "Image Receipt" anstatt "Image View"

//Bildtypen können teiweise aus anderen Bildtypen erzeugt werden
//CGImage <=> UIImage
//UIImage, CGImage => CIImage => CGImage
//UIImage, CGImage => Image

//Typen repräsentieren pure Daten -> nicht als View darstellbar


