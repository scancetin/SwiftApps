//
//  WidgetPokemonBundle.swift
//  WidgetPokemon
//
//  Created by Can Cetin on 16.08.2023.
//

import WidgetKit
import SwiftUI

@main
struct WidgetPokemonBundle: WidgetBundle {
    var body: some Widget {
        WidgetPokemon()
        WidgetPokemonLiveActivity()
    }
}
