//
//  MenuViewModel.swift
//  week08_mission
//
//  Created by 채리원 on 5/31/24.
//

import Foundation

class MenuViewModel: ObservableObject {
    @Published var selectedSize: SizeOption = .m
    @Published var isCheeseSelected: Bool = false

    let prices: [String] = ["20,000원", "26,000원", "3,000원"]

    enum SizeOption {
        case m, l
    }
}
