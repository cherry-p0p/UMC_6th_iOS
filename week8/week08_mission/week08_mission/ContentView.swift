//
//  ContentView.swift
//  week08_mission
//
//  Created by 채리원 on 5/25/24.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    MenuImageView()
                    
                    Divider()
                    
                    MenuView()
                    
                    Divider()
                }
            }
            .navigationBarTitle("메뉴")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#Preview {
    ContentView()
}
