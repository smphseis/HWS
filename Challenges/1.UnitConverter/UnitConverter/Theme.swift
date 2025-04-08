import Foundation

enum Theme: String, CaseIterable, Identifiable {
    case temperature = "thermometer.low"
    case length = "ruler"
    case time = "clock"
    case volume = "flask"
    
    var id: Self {
        return self
    }
}

func getOptions(_ theme : Theme) -> [Dimension] {
    switch theme {
    case .temperature:
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
    case .length:
        [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    case .time:
        [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours]
    case .volume:
        [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
    }
}
