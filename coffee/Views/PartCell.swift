//
//  UnitCell.swift
//  coffee
//
//  Created by Adam Geiger on 12/30/20.
//

import SwiftUI

struct PartCell: View {
    var type: String = "RATIO"
    var value: String = "16:1"
    var unit: String = "standard"
    var body: some View {
        HStack {
            IncrementButton(direction: .down)
            VStack {
                Text(type)
                    .font(.title2)
                Text(value)
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                Text(unit)
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
            }
            IncrementButton(direction: .up)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.secondary, lineWidth: 4))
        
    }
}

struct PartCell_Previews: PreviewProvider {
    static var previews: some View {
        PartCell(
            type: "RATIO",
            value: "16:1",
            unit: "standard"
        )
    }
}
