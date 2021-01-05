//
//  IncrementButton.swift
//  coffee
//
//  Created by Adam Geiger on 12/30/20.
//

import SwiftUI

enum Direction {
    case up
    case down
}

struct IncrementButton: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    var value: Double
    var part: Parts
    var direction: Direction = .up
    
    var body: some View {
        Button(action: {
            viewModel.Update(
                value: direction == Direction.up ? value + 1 : value - 1,
                part: part)
        }) {
            Image(systemName: direction == .up ? "plus.circle.fill" : "minus.circle.fill")
        }
    }
}

struct IncrementButton_Previews: PreviewProvider {
    static var previews: some View {
        IncrementButton(value: 0, part: .grounds)
    }
}
