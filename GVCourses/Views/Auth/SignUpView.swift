//
//  SignUpView.swift
//  GVCourses
//
//  Created by Minh Tran on 26/10/2023.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @Binding var isPresented: Bool
    @EnvironmentObject var errorHandling: ErrorHandling
    @State var email: String = ""
    @State var password: String = ""
    @State var password2: String = ""
    
    var body: some View {
        VStack {
            VStack {
                AuthHeader()
                    .padding(.bottom)
                
                CustomTextfield(title: "Email", text: $email)
                CustomTextfield(title: "Password", text: $password, isPassword: true)
                CustomTextfield(title: "Confirm password", text: $password2, isPassword: true)
                
                CustomButton(text: "Sign up") {
                    AuthManager.shared.signUpWithEmail(email: email, password: password, password2: password2) { error in
                        // TODO: Handle ERROR
                        self.errorHandling.handle(error: error!)
                    }
                }
                
                LabelledDivider(label: "or")
                
                GoogleSiginBtn(text: "Sign up with Google") {
                    // TODO: - Call the sign method here
                    AuthManager.shared.signInWithGoogle(presenting: getRootViewController()) { error in
                        // TODO: Handle ERROR
                        self.errorHandling.handle(error: error!)
                    }
                }
            }
            .padding(.top, 52)
            Spacer()
        }
        Button("Already have an account? Sign in") {
            isPresented.toggle()
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isPresented: .constant(true))
    }
}

