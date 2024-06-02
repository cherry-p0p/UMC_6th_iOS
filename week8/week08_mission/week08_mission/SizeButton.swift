//
//  SizeButton.swift
//  week08_mission
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct SizeButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .foregroundColor(isSelected ? .white : .black)
                .padding()
                .background(isSelected ? Color(hex: "6BBFBF") : Color(hex: "F2F2F2"))
                .cornerRadius(10)
        }
    }
}
