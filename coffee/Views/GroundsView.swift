//
//  GroundsView.swift
//  coffee
//
//  Created by Adam Geiger on 12/31/20.
//

import SwiftUI

struct GroundsView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var value: String = "0"
    @State private var isEdit: Bool = false
    
    var body: some View {
        let valueBind = Binding<String>(get: {
            if isEdit {
                return self.value
            }
            else {
                return "\(viewModel.parts.groundsAmount.value)"
            }
        }, set: {
            self.value = $0
        })
        HStack {
            IncrementButton(direction: .down)
            VStack {
                Text("Grounds")
                    .font(.title2)
                TextField("", text: valueBind) { isEditing in
                    self.isEdit = isEditing
                } onCommit: {
                    viewModel.Update(value: Double(self.value)!, part: .grounds)
                }
                .font(.largeTitle)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                Text(viewModel.parts.groundsAmount.unit == MeasuringUnit.grams ? "g" : "oz")
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
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

struct GroundsView_Previews: PreviewProvider {
    static var previews: some View {
        GroundsView()
            .environmentObject(CoffeePartsViewModel())
    }
}
