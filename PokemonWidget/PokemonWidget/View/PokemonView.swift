//
//  PokemonView.swift
//  PokemonWidget
//
//  Created by Can Cetin on 16.08.2023.
//

import SwiftUI

struct PokemonView: View {
    var pokemon : Pokemon
    
    var body: some View {
        HStack {
            ImageView(image: Image(pokemon.image))
                .frame(width: 130, height: 130)
            Spacer()
            VStack {
                Text(pokemon.name)
                    .foregroundColor(.brown)
                    .font(.title)
                    .fontWeight(.bold)
                Text(pokemon.type)
                    .foregroundColor(.orange)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: pokeList[0])
    }
}
