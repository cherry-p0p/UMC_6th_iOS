import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var loggedInUser: User?
    
    func fetchCurrentUserInfo() {
       
    }
}

struct User {
    var id: Int
    var name: String
    var email: String
    var avatar: String
}

struct ProfileView: View {
    
    @State private var nameText: String = ""
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var passwordConfirmText: String = ""
    @State private var isShowingProgressView = false
    @State private var isShowingAlert: Bool = false        
    
    @State private var id: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var avatarImg: String = ""
    
    @ObservedObject var userVM = UserViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                Section{
                    HStack{
                        Spacer()
                        if !avatarImg.isEmpty {
                            AsyncImage(url: URL(string: avatarImg)!) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .failure:
                                    Image(systemName: "person.fill.questionmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .frame(width: 250, height: 250, alignment: .center)
                                @unknown default:
                                    EmptyView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                }
                            }
                        } else {
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(width: 250, height: 250, alignment: .center)
                        }
                        Spacer()
                    }
                }
                Section{
                    Text("아이디: \(id)")
                    Text("이름: \(name)")
                    Text("이메일: \(email)")
                }
                Section{
                    Button {
                        print("새로고침 버튼 클릭")
                        userVM.fetchCurrentUserInfo()
                    } label: {
                        Text("새로고침")
                    }

                }
            }
            .onAppear(perform: {
                print("ProfileView onAppear() called")
                userVM.fetchCurrentUserInfo()
            })
            .onReceive(userVM.$loggedInUser, perform: { loggedInUser in
                print("ProfileView onReceive() called / loggedInUser")
                guard let user = loggedInUser else { return }
                self.id = "\(user.id)"
                self.name = user.name
                self.email = user.email
                self.avatarImg = user.avatar
            })
        }.navigationTitle("로그인 하기")
    }
}

#Preview {
    ProfileView()
}
