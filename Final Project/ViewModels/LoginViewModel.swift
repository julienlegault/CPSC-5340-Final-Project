//
//  LoginViewModel.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var signInState = false
    @Published var hasError = false
    @Published var error : LoginModelError?
    
    func login(user: UserModel) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.hasError.toggle()
                strongSelf.error = LoginModelError.customError(error: error)
            } else {
                print("User signed in successfully")
                strongSelf.signInState = true
            }
        }
    }
    
    func createAccount(user: UserModel) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                self.hasError.toggle()
                self.error = LoginModelError.customError(error: error)
            } else {
                print("User signed up successfully")
                self.signInState = true
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.signInState = false
        } catch {
            self.hasError.toggle()
            self.error = LoginModelError.signOutError
        }
    }
}

extension LoginViewModel {
    enum LoginModelError : LocalizedError {
        case signOutError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .signOutError:
                return "Error signing out"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}
