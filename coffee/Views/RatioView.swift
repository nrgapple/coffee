//
//  UnitCell.swift
//  coffee
//
//  Created by Adam Geiger on 12/30/20.
//

import SwiftUI

struct RatioView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var ratio: String = "16"
    @State private var strength: String = "standard"
    @State private var isEdit: Bool = false
    
    var body: some View {
        let valueBind = Binding<String>(get: {
            if isEdit {
                return self.ratio
            }
            else {
                return "\(viewModel.parts.ratio)"
            }
        }, set: {
            self.ratio = $0
        })
        HStack {
            IncrementButton(value: viewModel.parts.ratio, part: .ratio, direction: .down)
            VStack {
                Text("RATIO")
                    .font(.title2)
                TextField("", text: valueBind) { isEditing in
                    self.isEdit = isEditing
                } onCommit: {
                    viewModel.Update(value: Float(self.ratio)!, part: .ratio)
                }
                .font(.largeTitle)
                    .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                Text(strength)
                    .font(.title3)
            }
            .frame(width: 150.0)
            IncrementButton(value: viewModel.parts.ratio, part: .ratio, direction: .up)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.secondary, lineWidth: 4))
        
    }
}

struct PartCell_Previews: PreviewProvider {
    static let viewModel = CoffeePartsViewModel()
    static var previews: some View {
        RatioView()
            .environmentObject(viewModel)
    }
}
