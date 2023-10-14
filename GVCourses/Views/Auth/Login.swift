//
//  Login.swift
//  GVCourses
//
//  Created by Minh Tran on 11/10/2023.
//

import SwiftUI
//import Firebase

struct Login: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @Namespace var animation
    
    @State var loginSuccess: Bool = false
    @State var showRegister: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                Image("gvsu_marktop_white")
                    .resizable()
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width - 200, height: (UIScreen.main.bounds.width - 200) * 0.5625)
                    .padding(.vertical, 50)
//                Spacer(minLength: 0)
                HStack{
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Login")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("Please sign in to continue")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.leading)
                
                CustomTextField(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                
                CustomTextField(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                    .padding(.top,5)
                
                Button(action: {
                    //                Auth.auth().signIn(withEmail: self.email, password: self.password){ (res, err) in
                    //                    if err != nil{
                    //                        // if there are any error it will show the error
                    //                        // And the login will not complete
                    //                        print(err!.localizedDescription)
                    //                        return
                    //                    }
                    //                    // To navigate to the user page or after login page
                    //                    self.transition = 1
                    //                }
                    if self.email == "minh@gmail.com" && self.password == "ok" {
                        self.loginSuccess.toggle()
                    }
                }) {
                    
                    HStack(spacing: 10){
                        Text("LOGIN")
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                Spacer(minLength: 0)
                
                HStack(spacing: 8){
                    Text("Don't have an account?")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Button(action: {showRegister.toggle()}) {
                        
                        Text("Sign up")
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .underline()
                    }
                }
                .padding()
            }
            .background(.brandPrimary, ignoresSafeAreaEdges: .all)
            // To change the view we have to use navigationDestination
            // After the login success it will change to the GVCoursesTabView()
            .navigationDestination(isPresented: $loginSuccess, destination: {
                GVCoursesTabView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            })
            .navigationDestination(isPresented: $showRegister, destination: {
                Register(show: $showRegister)
            })
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
