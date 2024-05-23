import SwiftUI

struct BottomView: View {
    var body: some View {
        Spacer()
        HStack (spacing: 25) {
            VStack {
                Image(systemName: "house.fill").frame(width: 50, height: 20)
                Text("홈").font(.system(size: 13))
            }
            

            VStack {
                Image(systemName: "list.bullet.clipboard").frame(width: 50, height: 20)
                Text("동네생활").font(.system(size: 13))
            }
            

            VStack {
                Image(systemName: "mappin.and.ellipse").frame(width: 50, height: 20)
                Text("내 근처").font(.system(size: 13))
            }
            
  
            VStack {
                Image(systemName: "message").frame(width: 50, height: 20)
                Text("채팅").font(.system(size: 13))
            }
            

            VStack {
                Image(systemName: "person").frame(width: 50, height: 20)
                Text("나의 당근").font(.system(size: 13))
            }
        }
    }
}

#Preview {
    BottomView()
}
