//
//  SizeSelectionView.swift
//  week08_mission
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct SizeSelectionView: View {
    @Binding var selectedSize: MenuViewModel.SizeOption
    @Binding var isCheeseSelected: Bool
    @ObservedObject var cartManager: CartManager

    var body: some View {
        VStack {
           
            Text("피자 사이즈 선택")
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 10)

            HStack {
                SizeButton(title: "M", isSelected: selectedSize == .m) {
                    selectedSize = .m
                }
                SizeButton(title: "L", isSelected: selectedSize == .l) {
                    selectedSize = .l
                }
            }

            Toggle("크림치즈골드 크러스트", isOn: $isCheeseSelected)
                .padding(.top, 10)
                .toggleStyle(CheckboxToggleStyle())

            Button(action: {
                let menuItem = MenuItem(name: "메뉴 이름", size: selectedSize, isCheeseSelected: isCheeseSelected)
                cartManager.addToCart(menuItem)
            }) {
                Text("장바구니")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(hex: "6BBFBF"))
                    .cornerRadius(8)
            }
        }
    }
}


#Preview {
    SizeSelectionView(
        selectedSize: .constant(.m),
        isCheeseSelected: .constant(false),
        cartManager: CartManager()
    )
}
