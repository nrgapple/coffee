//
//  ContentView.swift
//  coffee-watch WatchKit Extension
//
//  Created by Adam Geiger on 1/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RatioView()
                    GroundsView()
                    WaterView()
                    BrewView()
                }
                .font(Font.custom("Montserrat-Light", size: 33))
            }
            .navigationTitle("Coffio")
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
