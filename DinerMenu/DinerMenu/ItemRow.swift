//
//  ItemRow.swift
//  DinerMenu
//
//  Created by Can Cetin on 23.04.2023.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.green, lineWidth: 2))
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(colors[restriction])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
