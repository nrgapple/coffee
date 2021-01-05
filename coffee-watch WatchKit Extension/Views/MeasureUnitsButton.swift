//
//  MeasureUnitsButton.swift
//  coffee-watch WatchKit Extension
//
//  Created by Adam Geiger on 1/4/21.
//

import SwiftUI

struct MeasureUnitsButton: View {
    @EnvironmentObject private var viewModel: CoffeePartsViewModel
    var part: Parts
    var unit: MeasuringUnit
    
    var body: some View {
        Button (action: {
            viewModel.UpdateUnits(part: part)
            WKInterfaceDevice.current().play(.click)
        }, label: {
            Text(unit == .grams ? "grams" : "ounces")
        })
        .font(Font.custom("Montserrat-Medium", size: 15))
        .frame(width: 70)
        .buttonStyle(PlainButtonStyle())
    }
}

struct MeasureUnitsButton_Previews: PreviewProvider {
    static var previews: some View {
        MeasureUnitsButton(part: .grounds, unit: .onces)
    }
}
