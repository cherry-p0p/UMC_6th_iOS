import SwiftUI

struct ContentView: View {
    @StateObject var userVM = UserVM()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 160))
                Spacer()
                NavigationLink(destination: LoginView(), label: {
                    HStack {
                        Spacer()
                        Text("로그인 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }).padding([.bottom], 10)
                
                NavigationLink(destination: RegisterView().environmentObject(userVM), label: {
                    HStack {
                        Spacer()
                        Text("회원가입 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                Spacer().frame(height: 40)
                NavigationLink(destination: ProfileView(), label: {
                    HStack {
                        Spacer()
                        Text("내 프로필 보러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }).padding([.bottom], 10)
                Spacer()
                Spacer()
            }
            .padding()
        }
        .environmentObject(userVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
