//
//  coffeeApp.swift
//  coffee-watch WatchKit Extension
//
//  Created by Adam Geiger on 1/4/21.
//

import SwiftUI

@main
struct coffeeApp: App {
    @StateObject private var viewModel = CoffeePartsViewModel()
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(viewModel)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
