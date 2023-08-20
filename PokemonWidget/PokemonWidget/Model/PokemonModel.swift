//
//  PokemonModel.swift
//  PokemonWidget
//
//  Created by Can Cetin on 16.08.2023.
//

import Foundation

struct Pokemon : Identifiable, Codable {
    var id: String {
        image
    }
    let name : String
    let image : String
    let type : String
}

let psyduck = Pokemon(name: "Psyduck", image: "psyduck", type: "Water")
let squirtle = Pokemon(name: "Squirtle", image: "squirtle", type: "Water")
let zubat = Pokemon(name: "Zubat", image: "zubat", type: "Flying")
let dratini = Pokemon(name: "Dratini", image: "dratini", type: "Dragon")
let bellsprout = Pokemon(name: "Bellsprout", image: "bellsprout", type: "Grass")

let pokeList = [psyduck, squirtle, zubat, dratini, bellsprout]
