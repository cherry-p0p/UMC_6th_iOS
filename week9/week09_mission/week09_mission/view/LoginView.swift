import Foundation
import SwiftUI
import Combine

class UserModelView: ObservableObject {
    let loginSuccess = PassthroughSubject<Void, Never>()
    
    func login(email: String, password: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loginSuccess.send(())
        }
    }
}

struct LoginView: View {
    
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var signInProcessing: Bool = false
    @State var shouldShowAlert: Bool = false
    @ObservedObject var userVM = UserModelView()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("로그인 정보")) {
                    TextField("이메일", text: $emailText)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("비밀번호", text: $passwordText)
                        .keyboardType(.default)
                }
                Section {
                    Button(action: {
                        print("로그인 버튼 클릭")
                        userVM.login(email: emailText, password: passwordText)
                    }) {
                        Text("로그인 하기")
                    }
                }
            }
            .alert("로그인이 완료되었습니다.", isPresented: $shouldShowAlert) {
                Button("확인", role: .cancel) {
                    dismiss()
                }
            }
        }.navigationTitle("로그인 하기")
        .onReceive(userVM.loginSuccess) { _ in
            shouldShowAlert = true
        }
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif

