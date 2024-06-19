import Foundation
import FirebaseAuth
import SwiftUI
import Firebase
import Combine

class UserVM: ObservableObject {
    @Published var registrationSuccess = PassthroughSubject<Void, Never>()
    @Published var registrationFailure = PassthroughSubject<String, Never>()

    func register(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.registrationFailure.send(error.localizedDescription)
                return
            }
            self.registrationSuccess.send(())
        }
    }
}


struct RegisterView: View {
    
    @EnvironmentObject var userVM: UserVM
    
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var shouldShowAlert: Bool = false
    @State fileprivate var alertMessage: String = ""
    
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var confirmPasswordInput: String = ""
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("이름"), content: {
                    TextField("이름", text: $nameInput).keyboardType(.default)
                })
                
                Section(header: Text("이메일"), content: {
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                })
                
                Section(header: Text("로그인 정보"), content: {
                    SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                    SecureField("비밀번호 확인", text: $confirmPasswordInput).keyboardType(.default)
                })
                
                Section {
                    Button(action: {
                        if passwordInput != confirmPasswordInput {
                            self.alertMessage = "비밀번호가 일치하지 않습니다."
                            self.shouldShowAlert = true
                            return
                        }
                        userVM.register(name: nameInput, email: emailInput, password: passwordInput)
                    }, label: {
                        Text("회원가입 하기")
                    })
                }
            }
            .onReceive(userVM.registrationSuccess, perform: {
                self.alertMessage = "회원가입이 완료되었습니다."
                self.shouldShowAlert = true
            })
            .onReceive(userVM.registrationFailure) { errorMessage in
                self.alertMessage = errorMessage
                self.shouldShowAlert = true
            }
            .alert(alertMessage, isPresented: $shouldShowAlert) {
                Button("확인", role: .cancel) {
                    if alertMessage == "회원가입이 완료되었습니다." {
                        self.dismiss()
                    }
                }
            }
        }.navigationTitle("회원가입")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(UserVM())
    }
}
