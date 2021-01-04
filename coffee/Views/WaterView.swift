//
//  WaterView.swift
//  coffee
//
//  Created by Adam Geiger on 12/31/20.
//

import SwiftUI

struct WaterView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var value: String = "0"
    @State private var isEdit: Bool = false
    
    var body: some View {
        let valueBind = Binding<String>(get: {
            if isEdit {
                return self.value
            }
            else {
                return "\(viewModel.parts.waterAmount.value)"
            }
        }, set: {
            self.value = $0
        })
        HStack {
            IncrementButton(direction: .down)
            VStack {
                Text("Water")
                    .font(.title2)
                TextField("", text: valueBind) { isEditing in
                    self.isEdit = isEditing
                } onCommit: {
                    viewModel.Update(value: Double(self.value)!, part: .water)
                }
                .font(.largeTitle)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                Text(viewModel.parts.waterAmount.unit == MeasuringUnit.grams ? "g" : "oz")
                    .font(.title3)
            }
            .frame(width: 150.0)
            IncrementButton(direction: .up)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.secondary, lineWidth: 4))
        
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
            .environmentObject(CoffeePartsViewModel())
    }
}
