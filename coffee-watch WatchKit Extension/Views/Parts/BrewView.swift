import SwiftUI

struct BrewView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var showPad = false
    
    func BackgroundColor() -> Color {
        return viewModel.parts.locked == .brew ? Color.red : Color.black
    }
    func TextColor() -> Color {
        return viewModel.parts.locked == .brew ? Color.black : Color.white
    }
    func HandleNewValue(value: String) {
        if let floatValue = Float(value) {
            let adjustedValue = viewModel.parts.brewAmount.unit == .grams ? floatValue : floatValue
            viewModel.Update(value: adjustedValue, part: .brew)
        }
        self.showPad = false
    }
    func Units() -> Float {
        if viewModel.parts.waterAmount.unit == .onces {
            return viewModel.parts.brewAmount.value / 28.35
        } else {
            return viewModel.parts.brewAmount.value
        }
    }
    var body: some View {
        VStack {
            LockButton(part: .brew, label: "BREW")
                .padding(.top, 4)
            HStack {
                Button(action: {
                    self.showPad.toggle()
                }, label: {
                    Text("\(Units().cleaner)")
                })
                MeasureUnitsButton(part: .brew, unit: viewModel.parts.brewAmount.unit)
            }
            .padding([.leading, .bottom, .trailing], 4.0)
        }
        .frame(maxWidth: .infinity)
        .background(BackgroundColor())
        .cornerRadius(15)
        .foregroundColor(TextColor())
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
