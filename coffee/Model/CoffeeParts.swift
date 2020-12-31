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

struct CoffeeParts {
    var ratio: Int = 16
    var waterAmount: CoffeePart = CoffeePart()
    var groundsAmount: CoffeePart = CoffeePart()
    var brewAmount: CoffeePart = CoffeePart()
}

struct CoffeePart {
    var unit: MeasuringUnit = .grams
    var value: Double = 0
    var locked: Bool = false
}
