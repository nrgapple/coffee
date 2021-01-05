import SwiftUI

struct WaterView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var showPad = false
    
    func BackgroundColor() -> Color {
        return viewModel.parts.locked == .water ? Color.red : Color.black
    }
    func TextColor() -> Color {
        return viewModel.parts.locked == .water ? Color.black : Color.white
    }
    func HandleNewValue(value: String) {
        if let floatValue = Float(value) {
            let adjustedValue = viewModel.parts.waterAmount.unit == .grams ? floatValue : floatValue
            viewModel.Update(value: adjustedValue, part: .water)
        }
        self.showPad = false
    }
    func Units() -> Float {
        if viewModel.parts.waterAmount.unit == .onces {
            return viewModel.parts.waterAmount.value / 28.35
        } else {
            return viewModel.parts.waterAmount.value
        }
    }
    var body: some View {
        VStack {
            LockButton(part: .water, label: "WATER")
                .padding(.top, 4)
            HStack {
                Button(action: {
                    self.showPad.toggle()
                }, label: {
                    Text("\(Units().cleaner)")
                })
                MeasureUnitsButton(part: .water, unit: viewModel.parts.waterAmount.unit)
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

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
            .environmentObject(CoffeePartsViewModel())
    }
}
