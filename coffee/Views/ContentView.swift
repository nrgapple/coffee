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
                RatioView()
                GroundsView()
                WaterView()
                BrewView()
            }
                .navigationBarTitle(Text("Calculator"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = CoffeePartsViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(viewModel)
    }
}
