//
//  PadButton.swift
//  coffee-watch WatchKit Extension
//
//  Created by Adam Geiger on 1/4/21.
//

import SwiftUI

struct PadButton: View {
    @Binding var value: String
    var number: String
    var image: String = ""
    var delete = false
    var body: some View {
        Button(action: {
            if delete {
                if value.count < 2 {
                    value = "0"
                } else {
                    value = String(value.dropLast())
                }
            } else {
                if (value == "0") {
                    value = number
                } else {
                    value += number
                }
            }
        }, label: {
            if image.isEmpty {
                Text(number)
            } else {
                Image(systemName: image)
            }
        })
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, maxHeight: 30)
        .background(Color.accentColor)
        .cornerRadius(15)
        .padding(.vertical, 1)
    }
}

struct PadButton_Previews: PreviewProvider {
    static var previews: some View {
        PadButton(value: .constant("0"), number: "1")
        PadButton(value: .constant("0"), number: "", image: "delete.left", delete: true)
    }
}
