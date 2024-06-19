import Foundation
import Firebase
import FirebaseAuth

class ViewModel: ObservableObject {
    
    func emailAuthSignUp(email: String, userName: String, password: String, completion: @escaping (Int?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if result != nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName
                changeRequest?.commitChanges { error in
                    if let error = error {
                        print("프로필 변경 오류: \(error.localizedDescription)")
                        completion(nil)
                        return
                    }
                    print("사용자 이메일: \(String(describing: result?.user.email))")
                    completion(1)
                }
            } else {
                completion(nil) 
            }
        }
    }
}

