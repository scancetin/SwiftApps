//
//  WidgetPokemon.swift
//  WidgetPokemon
//
//  Created by Can Cetin on 16.08.2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    @AppStorage("pokemon", store: UserDefaults(suiteName: "group.com.olympos.PokemonWidget"))
    var pokemonData : Data = Data()
    
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), pokemon: Pokemon(name: "Zubat", image: "zubat", type: "Flying"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let pokemon: Pokemon
}

struct WidgetPokemonEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ImageView(image: Image(entry.pokemon.image))
            .padding()
    }
}

struct WidgetPokemon: Widget {
    let kind: String = "WidgetPokemon"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetPokemonEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetPokemon_Previews: PreviewProvider {
    static var previews: some View {
        WidgetPokemonEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(),pokemon: Pokemon(name: "Zubat", image: "zubat", type: "Flying")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
