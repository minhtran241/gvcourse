//
//  Register.swift
//  GVCourses
//
//  Created by Minh Tran on 11/10/2023.
//

import SwiftUI
//import Firebase

struct Register: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    
    @Namespace var animation
    
    @Binding var show : Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack{
                HStack{
                    
                    Button(action: {
                        show.toggle()
                    }) {
                        
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.leading)
                
                Image("gvsu_marktop_white")
                    .resizable()
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width - 200, height: (UIScreen.main.bounds.width - 200) * 0.5625)
                    .padding(.bottom, 40)
                
                
                CustomTextField(image: "person", title: "FULL NAME", value: $name, animation: animation)
                
                CustomTextField(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                    .padding(.top,5)
                
                CustomTextField(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                    .padding(.top,5)
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        //                        let db = Firestore.firestore()
                        //                        if name == "" || name == " "{
                        //                            return
                        //                        }
                        //                        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                        //                            guard result != nil, error == nil else{
                        //                                print(error!.localizedDescription)
                        //                                return
                        //                            }
                        //                            if (result?.user != nil) {
                        //                                db.collection("users").document(result?.user.uid ?? "").setData([
                        //                                    "FullName":name,
                        //                                    "UID":result?.user.uid ?? "",
                        //                                    "isVerified" : false
                        //                                ])
                        //                            }
                        //                        }
                        print("clicked")
                    }) {
                        
                        Text("SIGN UP")
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                        
                    }
                }
                .padding()
                .padding(.top)
                .padding(.trailing)
                
                HStack{
                    
                    Text("Already have a account?")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        show.toggle()
                    }) {
                        
                        Text("Sign in")
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .underline()
                    }
                }
                .padding()
                .padding(.top,10)
                
            }
        })
        .background(.brandPrimary, ignoresSafeAreaEdges: .all)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register(show: .constant(true))
    }
}
