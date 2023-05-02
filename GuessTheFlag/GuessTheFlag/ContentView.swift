//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Can Cetin on 2.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your Content")
                .padding(50)
                .background(.ultraThinMaterial)
                
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
