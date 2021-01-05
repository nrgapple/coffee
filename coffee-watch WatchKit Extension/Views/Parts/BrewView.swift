import SwiftUI

struct BrewView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var showPad = false
    
    func BackgroundColor() -> Color {
        return viewModel.parts.locked == .brew ? Color.accentColor : Color.black
    }
    func TextColor() -> Color {
        return viewModel.parts.locked == .brew ? Color.black : Color.white
    }
    func ValueColor() -> Color {
        return viewModel.parts.locked == .brew ? Color.black : Color.accentColor
    }
    func HandleNewValue(value: String) {
        if let floatValue = Float(value) {
            let adjustedValue = viewModel.parts.brewAmount.unit == .grams ? floatValue : floatValue
            viewModel.Update(value: adjustedValue, part: .brew)
        }
        self.showPad = false
    }
    func Units() -> Float {
        if viewModel.parts.brewAmount.unit == .onces {
            return viewModel.parts.brewAmount.value / 28.35
        } else {
            return viewModel.parts.brewAmount.value
        }
    }
    var body: some View {
        VStack {
            LockButton(part: .brew, label: "BREW")
                .foregroundColor(TextColor())
            HStack {
                Button(action: {
                    self.showPad.toggle()
                }, label: {
                    Text("\(Units().cleaner)")
                })
                .font(Font.custom("Montserrat-Medium", size: 30))
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(ValueColor())
            }
            .padding([.leading, .trailing], 4.0)
            MeasureUnitsButton(part: .brew, unit: viewModel.parts.brewAmount.unit)
                .foregroundColor(TextColor())
        }
        .padding([.top, .bottom], 4)
        .frame(maxWidth: .infinity)
        .background(BackgroundColor())
        .cornerRadius(15)
        .sheet(isPresented: $showPad, content: {
            NumberPadView(fromInitial: "\(Units().cleaner)", fromDone: HandleNewValue)
        })
    }
}

struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView()
            .environmentObject(CoffeePartsViewModel())
    }
}
