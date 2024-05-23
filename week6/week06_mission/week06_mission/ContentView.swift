import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("15:16")
                    .font(.system(size: 20))
                    .padding(.leading, 20)
                Spacer()
                
                Image(systemName: "cellularbars")
                    .font(.system(size: 20))
                Image(systemName: "wifi")
                    .font(.system(size: 20))
                Image(systemName: "battery.50percent")
                    .font(.system(size: 20))
                    .padding(.trailing, 10)
            }
            .foregroundColor(.white)
            .background(Color(hex: "00C7AE"))
            .padding(.top, 45)
            
            HStack {
                Text("우리집")
                    .font(.system(size: 20))
                    .padding(.leading, 10)
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.system(size: 10))
                Spacer()
                
                Image(systemName: "square.grid.2x2")
                    .font(.system(size: 20))
                Image(systemName: "bell")
                    .font(.system(size: 20))
                Image(systemName: "cart")
                    .font(.system(size: 20))
                    .padding(.trailing, 10)
            }
            .foregroundColor(.white)
            .background(Color(hex: "00C7AE"))
            
            VStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(hex: "00C7AE"))
                    SearchBarView()
                        .padding(15)
                }
                
                VStack(spacing: 15) {
                    BannerView(imageName: "banner1", width: 370, height: 120)
                    BannerView(imageName: "banner2", width: 370, height: 90)
                    BannerView(imageName: "menu", width: 370, height: 200)
                    BannerView(imageName: "banner3", width: 370, height: 120)
                }
                .padding(.horizontal, 10)
                
                BottomView()

            }
        }
    }
}

struct BannerView: View {
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: width, height: height)
                .cornerRadius(10)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
