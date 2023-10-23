//
//  FireAuth.swift
//  GVCourses
//
//  Created by Minh Tran on 22/10/2023.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase

struct AuthManager {
    static let shared = AuthManager()
    private let auth = Auth.auth()
    
    private init() {}
    
    func signinWithGoogle(presenting: UIViewController,
                          completion: @escaping (Error?) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: presenting) {authentication, error in
            
            if let error = error {
                completion(error)
                return
            }
            
            guard let user = authentication?.user, let idToken = user.idToken?.tokenString else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            self.auth.signIn(with: credential) { result, error in
                guard error == nil else {
                    completion(error)
                    return
                }
                print("SIGN IN")
                UserDefaults.standard.set(true, forKey: "signIn") // When this change to true, it will go to the home screen
            }
        }
    }
    
    func signInWithEmail(email: String, password: String) {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        self.auth.signIn(withEmail: email, password: password) { (result, error) in
            guard result != nil, error == nil else {
                return
            }
            print("SIGN IN")
            UserDefaults.standard.set(true, forKey: "signIn") // When this change to true, it will go to the home screen
        }
    }
    
    func signout() {
        GIDSignIn.sharedInstance.signOut()
        do {
            try self.auth.signOut()
            print("SIGN OUT")
            UserDefaults.standard.set(false, forKey: "signIn") // When this change to false, it will go to the sign in screen
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
