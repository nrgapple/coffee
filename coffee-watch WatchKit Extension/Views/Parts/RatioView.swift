//
//  RatioView.swift
//  coffee-watch WatchKit Extension
//
//  Created by Adam Geiger on 1/4/21.
//

import SwiftUI

struct RatioView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var showPad = false
    
    func BackgroundColor() -> Color {
        return viewModel.parts.locked == .ratio ? Color.accentColor : Color.black
    }
    func TextColor() -> Color {
        return viewModel.parts.locked == .ratio ? Color.black : Color.white
    }
    func ValueColor() -> Color {
        return viewModel.parts.locked == .ratio ? Color.black : Color.accentColor
    }
    func HandleNewValue(value: String) {
        if let floatValue = Float(value) {
            if floatValue < 1000 {
                viewModel.Update(value: floatValue, part: .ratio)
            }
        }
        self.showPad = false
    }
    var body: some View {
        VStack {
            LockButton(part: .ratio, label: "RATIO")
                .foregroundColor(TextColor())
            HStack {
                Button(action: {
                    self.showPad.toggle()
                }, label: {
                    Text("\(viewModel.parts.ratio.cleaner)")
                    Text(": 1")
                })
                .font(Font.custom("Montserrat-Medium", size: 30))
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(ValueColor())
            }
            .padding([.leading, .trailing], 4.0)
            .fixedSize()
        }
        .padding([.top, .bottom], 4)
        .frame(maxWidth: .infinity)
        .background(BackgroundColor())
        .cornerRadius(15)
        .sheet(isPresented: $showPad, content: {
            NumberPadView(fromInitial: "\(viewModel.parts.ratio.cleaner)", fromDone: HandleNewValue)
        })
    }
}

struct RatioView_Previews: PreviewProvider {
    static var previews: some View {
        RatioView()
            .environmentObject(CoffeePartsViewModel())
    }
}
