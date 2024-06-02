//
//  CheckboxToggleStyle.swift
//  week08_mission
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? Color(hex: "6BBFBF") : .gray)
        }
    }
}
