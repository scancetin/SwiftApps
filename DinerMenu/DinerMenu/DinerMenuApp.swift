//
//  DinerMenuApp.swift
//  DinerMenu
//
//  Created by Can Cetin on 23.04.2023.
//

import SwiftUI

@main
struct DinerMenuApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
