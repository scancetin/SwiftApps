//
//  ImageView.swift
//  PokemonWidget
//
//  Created by Can Cetin on 16.08.2023.
//

import SwiftUI

struct ImageView: View {
    var image : Image
    
    var body: some View {
        image.resizable()
            .scaledToFit()
            .padding()
            .clipShape(Circle())
            .overlay(Circle().stroke(.brown, lineWidth: 5))
            .shadow(radius: 15)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("zubat"))
    }
}
