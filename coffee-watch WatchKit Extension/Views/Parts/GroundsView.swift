import SwiftUI

struct GroundsView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var showPad = false
    
    func BackgroundColor() -> Color {
        return viewModel.parts.locked == .grounds ? Color.accentColor : Color.black
    }
    func TextColor() -> Color {
        return viewModel.parts.locked == .grounds ? Color.black : Color.white
    }
    func ValueColor() -> Color {
        return viewModel.parts.locked == .grounds ? Color.black : Color.accentColor
    }
    func HandleNewValue(value: String) {
        if let floatValue = Float(value) {
            let adjustedValue = viewModel.parts.groundsAmount.unit == .grams ? floatValue : floatValue
            viewModel.Update(value: adjustedValue, part: .grounds)
        }
        self.showPad = false
    }
    func Units() -> Float {
        if viewModel.parts.groundsAmount.unit == .onces {
            return viewModel.parts.groundsAmount.value / 28.35
        } else {
            return viewModel.parts.groundsAmount.value
        }
    }
    var body: some View {
        VStack {
            LockButton(part: .grounds, label: "GROUNDS")
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
            MeasureUnitsButton(part: .grounds, unit: viewModel.parts.groundsAmount.unit)
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

struct GroundsView_Previews: PreviewProvider {
    static var previews: some View {
        GroundsView()
            .environmentObject(CoffeePartsViewModel())
    }
}
