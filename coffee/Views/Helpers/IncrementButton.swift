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
    var direction: Direction = .up
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: direction == .up ? "plus.circle.fill" : "minus.circle.fill")
        }
    }
}

struct IncrementButton_Previews: PreviewProvider {
    static var previews: some View {
        IncrementButton(direction: .up)
    }
}
