//
//  PriceInfoView.swift
//  week08_mission
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct PriceInfoView: View {
    let prices: [String]

    var body: some View {
        VStack {
            Text("사이즈 M: \(prices[0])")
            Text("사이즈 L: \(prices[1])")
            Text("크러스트: \(prices[2])")
        }
        .font(.system(size: 17, weight: .regular))
        .offset(y: -60)
    }
}

#Preview {
    PriceInfoView(prices: ["20,000원", "28,000원", "4000원"])
}
