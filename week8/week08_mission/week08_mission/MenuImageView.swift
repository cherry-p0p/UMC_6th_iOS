//
//  MenuImageView.swift
//  week08_mission
//
//  Created by 채리원 on 5/26/24.
//

import SwiftUI

struct MenuImageView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .padding(.trailing, 100)
                
                Image(systemName: "house")
                    .padding(.leading, 120)
                Image(systemName: "square.and.pencil")
                    .padding(.leading, 5)
                Image(systemName: "cart")
                    .padding(.leading, 5)
            }
            Image("pizza")
            Divider()
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        Image("title")
                            .padding(.top, 2)
                            .padding(.leading, -10)
                        Text("[재주문 1위] 바싹불고기피자")
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    Text("바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작")
                        .font(.system(size: 16, weight: .thin))
                    Text("영양성분 및 알레르기 성분 보기")
                        .font(.system(size: 13, weight: .thin))
                        .padding(6)
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .cornerRadius(15)
                }
                .padding(10)
            }
        }
        
        Spacer()
    }
}

#Preview {
    MenuImageView()
}
