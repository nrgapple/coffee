//
//  LockButton.swift
//  coffee-watch WatchKit Extension
//
//  Created by Adam Geiger on 1/4/21.
//

import SwiftUI

struct LockButton: View {
    @EnvironmentObject private var viewModel: CoffeePartsViewModel
    var part: Parts
    var label: String
    
    var body: some View {
        Button (action: {
            viewModel.Lock(part: part)
        }, label: {
            Text(label)
        })
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
    }
}

struct LockButton_Previews: PreviewProvider {
    static var previews: some View {
        LockButton(part: .ratio, label: "RATIO")
            .environmentObject(CoffeePartsViewModel())
    }
}
