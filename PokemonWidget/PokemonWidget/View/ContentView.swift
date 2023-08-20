//
//  ContentView.swift
//  PokemonWidget
//
//  Created by Can Cetin on 16.08.2023.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @AppStorage("pokemon", store: UserDefaults(suiteName: "group.com.olympos.PokemonWidget"))
    var pokemonData : Data = Data()
    
    var body: some View {
        List(pokeList, id:\.image ) { pokemon in
            PokemonView(pokemon: pokemon)
                .onTapGesture {
                    savePokemon(pokemon: pokemon)
                }
        }
    }
    
    func savePokemon(pokemon: Pokemon) {
        if let pokemonData = try?
            JSONEncoder().encode(pokemon) {
            self.pokemonData = pokemonData
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetPokemon")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
