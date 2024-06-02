//
//  MenuView.swift
//  week08_mission
//
//  Created by 채리원 on 5/26/24.
//

import SwiftUI
import Foundation

struct MenuItem: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let size: MenuViewModel.SizeOption
    let isCheeseSelected: Bool
}


struct MenuView: View {
    @StateObject private var viewModel = MenuViewModel()
    @StateObject private var cartManager = CartManager()

    var body: some View {
            VStack {
                HStack(alignment: .bottom, spacing: 90) {
                    SizeSelectionView(
                        selectedSize: $viewModel.selectedSize,
                        isCheeseSelected: $viewModel.isCheeseSelected,
                        cartManager: cartManager
                    )

                    PriceInfoView(prices: viewModel.prices)
                }
            }
            .padding(20)
   

                NavigationLink(destination: CartView(cartManager: cartManager)) {
                    Text("장바구니 보기")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "6BBFBF"))
                        .cornerRadius(10)
                }
                .padding(.top, 16)
            }
        }

    

    
    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }
    

