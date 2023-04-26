//
//  CheckoutView.swift
//  DinerMenu
//
//  Created by Can Cetin on 24.04.2023.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    
    let paymentTypes = ["Cash", "Credit Card", "App Points"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    @State private var showPaymentAlert = false
    
    var totalPrice : String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Payment type", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if (addLoyaltyDetails) {
                    TextField("Enter you app ID", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Total amount \(totalPrice)") {
                Button("Confirm Order") {
                    showPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showPaymentAlert) {
            // buttons here
        } message: {
            Text("Your total was \(totalPrice)")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
