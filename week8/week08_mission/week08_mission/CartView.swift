//
//  CartView.swift
//  week08_mission
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .padding(.trailing, 100)
                    
                    Image(systemName: "house")
                        .padding(.leading, 120)
                    Image(systemName: "square.and.pencil")
                        .padding(.leading, 5)
                }
                
                
                Text("배달로 받을게요")
                    .font(.system(size: 20, weight: .bold))
                 
                
                Text("자가제빵 선명희피자")
                    .font(.system(size: 20, weight: .regular))


                if cartManager.cartItems.isEmpty {
                    Text("장바구니가 비어있습니다.")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    ScrollView {
                        ForEach(cartManager.cartItems) { item in
                            CartItemView(item: item)
                        }
                    }

                    

                    Button(action: {
                    }) {
                        Text("주문하기")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(hex: "6BBFBF"))
                            .cornerRadius(10)
                    }
               
                }
                Spacer()
            }
            
        }
    }
}

struct CartItemView: View {
    let item: MenuItem

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.system(size: 20, weight: .bold))

                Text("바싹불고기피자: \(item.size == .m ? "M" : "L")")
                    .font(.body)

                if item.isCheeseSelected {
                    Text("크림치즈골드 크러스트")
                        .font(.body)
                }
            }

            Spacer()

            Text(item.size == .m ? "20,000원" : "26,000원")
                .font(.system(size: 20, weight: .regular))
        }
        .padding(13)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(10)
    }
}



#Preview {
    CartView(cartManager: CartManager())
}
