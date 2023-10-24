//
//  Login.swift
//  GVCourses
//
//  Created by Minh Tran on 11/10/2023.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    
    @EnvironmentObject var errorHandling: ErrorHandling
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack {
                LoginHeader()
                    .padding(.bottom)
                
                CustomTextfield(title: "Email", text: $email)
                CustomTextfield(title: "Password", text: $password, isPassword: true)
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Forgot Password?")
                    }
                }
                .padding(.trailing, 24)
                .padding(.bottom, 12)
                
                CustomButton {
                    AuthManager.shared.signInWithEmail(email: email, password: password) { error in
                        // TODO: Handle ERROR
                        self.errorHandling.handle(error: error!)
                    }
                }

                LabelledDivider(label: "or")
                
                GoogleSiginBtn {
                    // TODO: - Call the sign method here
                    AuthManager.shared.signinWithGoogle(presenting: getRootViewController()) { error in
                        // TODO: Handle ERROR
                        self.errorHandling.handle(error: error!)
                    }
                }
            }
            .padding(.top, 52)
            Spacer()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
