//
//  CheckoutView.swift
//  CupcakeDelivery
//
//  Created by Can Cetin on 5.05.2023.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State var showAlert = false
    
    var body: some View {
            VStack {
                AsyncImage(url: URL(string: "https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }.frame(height: 233)
                
                Text("Your total is \(order.totalCost, format: .currency(code: "USD"))").font(.title)
                
                Button("Place order") {
                    showAlert = true
                }.padding()
                
                Spacer()
            }
            .navigationTitle("Check Out")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Thank You!", isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                Text("\(order.quantity)x \(Order.types[order.type])")
            }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
