import SwiftUI

struct GroundsView: View {
    @EnvironmentObject var viewModel: CoffeePartsViewModel
    @State private var showPad = false
    
    func BackgroundColor() -> Color {
        return viewModel.parts.locked == .grounds ? Color.red : Color.black
    }
    func TextColor() -> Color {
        return viewModel.parts.locked == .grounds ? Color.black : Color.white
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
                .padding(.top, 4)
            HStack {
                Button(action: {
                    self.showPad.toggle()
                }, label: {
                    Text("\(Units().cleaner)")
                })
                MeasureUnitsButton(part: .grounds, unit: viewModel.parts.groundsAmount.unit)
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

struct GroundsView_Previews: PreviewProvider {
    static var previews: some View {
        GroundsView()
            .environmentObject(CoffeePartsViewModel())
    }
}
