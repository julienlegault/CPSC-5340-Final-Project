//
//  ContentView.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import SwiftUI

struct LoginView: View {
    @State var user = UserModel(email: "", password: "")
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var body: some View {
        if loginViewModel.signInState {
            CardListView()
        } else {
            VStack {
                TextField("Email", text: $user.email)
                SecureField("Password", text: $user.password)
                HStack {
                    Button {
                        loginViewModel.createAccount(user: user)
                    } label: {
                        Text("Create Account")
                    }
                    Spacer()
                    Button {
                        loginViewModel.login(user: user)
                    } label: {
                        Text("Sign In")
                    }
                }
            }
            .padding()
            .alert(isPresented: $loginViewModel.hasError, error: loginViewModel.error) {
                Text("")
            }
        }
    }
}

#Preview {
    LoginView()
}
