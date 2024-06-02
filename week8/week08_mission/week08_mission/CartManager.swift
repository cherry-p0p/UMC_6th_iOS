//
//  CartManager.swift
//  week08_mission
//
//  Created by 채리원 on 5/31/24.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cartItems: [MenuItem] = []

    func addToCart(_ item: MenuItem) {
        cartItems.append(item)
    }
}
