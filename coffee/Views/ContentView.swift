//
//  ContentView.swift
//  coffee
//
//  Created by Adam Geiger on 12/30/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                PartCell(
                    type: "RATIO", value: "16:1", unit: "standard"
                )
                PartCell(
                    type: "RATIO", value: "16:1", unit: "standard"
                )
                PartCell(
                    type: "RATIO", value: "16:1", unit: "standard"
                )
                PartCell(
                    type: "RATIO", value: "16:1", unit: "standard"
                )
            }
                .navigationBarTitle(Text("Calculator"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
