//
//  CoffeePartsViewModel.swift
//  coffee
//
//  Created by Adam Geiger on 12/30/20.
//

import Foundation
import Combine

final class CoffeePartsViewModel: ObservableObject {
    @Published var parts: CoffeeParts = CoffeeParts()
    
    func Lock(part: Parts) {
        parts.locked = part
    }
    
    func UpdateUnits(part: Parts) {
        switch part {
        case .brew:
            parts.brewAmount.unit = parts.brewAmount.unit == .grams ? .onces : .grams
            break
        case .water:
            parts.waterAmount.unit = parts.waterAmount.unit == .grams ? .onces : .grams
            break
        case .grounds:
            parts.groundsAmount.unit = parts.groundsAmount.unit == .grams ? .onces : .grams
            break
        default:
            break
        }
    }
    
    func Update(value: Float, part: Parts) {
        let groundsPrev = parts.groundsAmount.value
        let waterPrev = parts.waterAmount.value
        let brewPrev = parts.brewAmount.value
        let ratioPrev = parts.ratio
        switch part {
        case .ratio:
            switch parts.locked {
            case .ratio:
                parts.groundsAmount.value = ratioPrev / value * groundsPrev
                parts.waterAmount.value = ratioPrev / value * waterPrev
                parts.brewAmount.value = ratioPrev / value * brewPrev
                parts.ratio = value
                break
            case .grounds:
                let newWater = value * groundsPrev
                parts.waterAmount.value = newWater
                parts.brewAmount.value = newWater - 2 * groundsPrev
                parts.ratio = value
                break
            case .water:
                parts.groundsAmount.value = waterPrev / value
                parts.brewAmount.value = waterPrev - 2 * (waterPrev / value)
                parts.ratio = value
                break
            case .brew:
                parts.groundsAmount.value = brewPrev / (value - 2)
                parts.waterAmount.value = (value * brewPrev) / (value - 1)
                parts.ratio = value
                break
            }
        case .grounds:
            var newGrounds = value
            if parts.groundsAmount.unit == .onces {
                newGrounds = value * 28.35
            }
            switch parts.locked {
            case .ratio:
                parts.groundsAmount.value = newGrounds
                parts.waterAmount.value = ratioPrev * newGrounds
                parts.brewAmount.value = newGrounds * (ratioPrev - 2)
                break
            case .grounds:
                parts.groundsAmount.value = newGrounds
                parts.waterAmount.value = ratioPrev * newGrounds
                parts.brewAmount.value = newGrounds * (ratioPrev - 2)
                break
            case .water:
                parts.groundsAmount.value = newGrounds
                parts.brewAmount.value = waterPrev - 2 * newGrounds
                parts.ratio = waterPrev / newGrounds
                break
            case .brew:
                parts.groundsAmount.value = newGrounds
                parts.waterAmount.value = 2 * newGrounds + brewPrev
                parts.ratio = brewPrev / newGrounds + 2
                break
            }
        case .water:
            var newWater = value
            if parts.waterAmount.unit == .onces {
                newWater = value * 28.35
            }
            switch parts.locked {
            case .ratio:
                parts.groundsAmount.value = newWater / ratioPrev
                parts.waterAmount.value = newWater
                parts.brewAmount.value = newWater - 2 * (newWater / ratioPrev)
                break
            case .grounds:
                parts.waterAmount.value = newWater
                parts.brewAmount.value = newWater - 2 * groundsPrev
                parts.ratio = newWater / groundsPrev
                break
            case .water:
                parts.groundsAmount.value = newWater / ratioPrev
                parts.waterAmount.value = newWater
                parts.brewAmount.value = newWater - 2 * (newWater / ratioPrev)
                break
            case .brew:
                parts.waterAmount.value = newWater
                parts.ratio = newWater / groundsPrev
                break
            }
        case .brew:
            var newBrew = value
            if parts.brewAmount.unit == .onces {
                newBrew = value * 28.35
            }
            switch parts.locked {
            case .ratio:
                parts.groundsAmount.value = newBrew / (ratioPrev - 2)
                parts.waterAmount.value = (ratioPrev * newBrew) / (ratioPrev - 1)
                parts.brewAmount.value = newBrew
                break
            case .grounds:
                parts.waterAmount.value = 2 * groundsPrev + newBrew
                parts.brewAmount.value = newBrew
                parts.ratio = newBrew / groundsPrev + 2
                break
            case .water:
                parts.groundsAmount.value = (waterPrev - newBrew) / 2
                parts.brewAmount.value = newBrew
                parts.ratio = 2 * waterPrev / (waterPrev - newBrew)
                break
            case .brew:
                parts.groundsAmount.value = newBrew / (ratioPrev - 2)
                parts.waterAmount.value = (ratioPrev * newBrew) / (ratioPrev - 1)
                parts.brewAmount.value = newBrew
                break
            }
        }
    }
}

