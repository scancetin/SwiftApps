//
//  Order.swift
//  CupcakeDelivery
//
//  Created by Can Cetin on 5.05.2023.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var zip = ""
    @Published var city = ""
    
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || zip.isEmpty || city.isEmpty {
            return false
        }
        return true
    }
    
    var totalCost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        cost += extraFrosting ? Double(quantity) : 0
        cost += addSprinkles ? Double(quantity) / 2: 0
        return cost
    }
}
