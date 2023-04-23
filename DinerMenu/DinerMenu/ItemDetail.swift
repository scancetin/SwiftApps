//
//  ItemDetail.swift
//  DinerMenu
//
//  Created by Can Cetin on 23.04.2023.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .padding(3)
                    .background(.black)
                    .foregroundColor(.white)
                    .offset(x: -20, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            
            Spacer()
        }
        .navigationTitle(item.name)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
