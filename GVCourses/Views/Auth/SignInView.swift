//
//  Login.swift
//  GVCourses
//
//  Created by Minh Tran on 11/10/2023.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    
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
                    FirebAuth.share.signInWithEmail(email: email, password: password)
                }
                
                GoogleSiginBtn {
                    // TODO: - Call the sign method here
                    FirebAuth.share.signinWithGoogle(presenting: getRootViewController()) { error in
                        // TODO: Handle ERROR
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
