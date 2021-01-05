//
//  NumberPadView.swift
//  coffee-watch WatchKit Extension
//
//  Created by Adam Geiger on 1/4/21.
//

import SwiftUI

struct NumberPadView: View {
    @State private var value: String
    var done: ((String) -> Void)
    init(fromInitial initial: String, fromDone doneFunc: @escaping ((String) -> Void)) {
        self.done = doneFunc
        _value = State(initialValue: initial)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(value)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 30)
                Button(action: {
                    self.done(value)
                }, label: {
                    Text("Done")
                })
                .padding()
            }
            HStack {
                PadButton(value: $value, number: "1")
                PadButton(value: $value, number: "2")
                PadButton(value: $value, number: "3")
            }
            HStack {
                PadButton(value: $value, number: "4")
                PadButton(value: $value, number: "5")
                PadButton(value: $value, number: "6")
            }
            HStack {
                PadButton(value: $value, number: "7")
                PadButton(value: $value, number: "8")
                PadButton(value: $value, number: "9")
            }
            HStack {
                PadButton(value: $value, number: ".")
                PadButton(value: $value, number: "0")
                PadButton(value: $value, number: "", image: "delete.left", delete: true)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct NumberPadView_Previews: PreviewProvider {
    func test(value: String) {}
    static var previews: some View {
        NumberPadView(fromInitial: "0", fromDone: {(value: String) -> () in })
    }
}
