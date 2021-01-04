//
//  CoffeeParts.swift
//  coffee
//
//  Created by Adam Geiger on 12/30/20.
//

import Foundation

enum MeasuringUnit {
    case grams
    case onces
}

enum CoffeeStrength {
    case stronger
    case weaker
    case standard
}

enum Parts {
    case grounds
    case water
    case brew
    case ratio
}

struct CoffeeParts {
    var locked: Parts = .ratio
    var ratio: Double = 16
    var waterAmount: CoffeePart = CoffeePart()
    var groundsAmount: CoffeePart = CoffeePart()
    var brewAmount: CoffeePart = CoffeePart()
}

struct CoffeePart {
    var unit: MeasuringUnit = .grams
    var value: Double = 0
}
