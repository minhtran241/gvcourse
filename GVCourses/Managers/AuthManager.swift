//
//  AuthManager.swift
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
    
    func signInWithGoogle(presenting: UIViewController,
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
    
    func signInWithEmail(email: String, password: String, completion: @escaping (Error?) -> Void) {
        if !validateSignIn(email: email, password: password) {
            let validationError = NSError(domain: "GVCourses", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid email or password"])
            completion(validationError)
            return
        }
        
        self.auth.signIn(withEmail: email, password: password) { (result, error) in
            guard result != nil, error == nil else {
                completion(error)
                return
            }
            print("SIGN IN")
            UserDefaults.standard.set(true, forKey: "signIn") // When this change to true, it will go to the home screen
        }
    }
    
    func signUpWithEmail(email: String, password: String, password2: String, completion: @escaping (Error?) -> Void) {
        // Check if email and password meet your validation criteria here if needed
        if !validateSignUp(email: email, password: password, password2: password2) {
            // You may want to return an error or call the completion handler with an error here.
            let validationError = NSError(domain: "GVCourses", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid email or password"])
            completion(validationError)
            return
        }
        
        self.auth.createUser(withEmail: email, password: password) { (result, error) in
            guard result != nil, error == nil else {
                // Registration failed; call the completion handler with the error
                completion(error)
                return
            }
            
            print("SIGN UP")
            // You can also automatically sign in the user after successful registration if needed.
            self.signInWithEmail(email: email, password: password) { (signInError) in
                if let error = signInError {
                    // Handle the sign-in error if needed
                    completion(error)
                    return
                }
            }
        }
    }
    
    
    func signOut(completion: @escaping (Error) -> Void) {
        GIDSignIn.sharedInstance.signOut()
        do {
            try self.auth.signOut()
            print("SIGN OUT")
            UserDefaults.standard.set(false, forKey: "signIn") // When this change to false, it will go to the sign in screen
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            let signingOutError = NSError(domain: "GVCourses", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error signing out: \(signOutError.localizedDescription)"])
            completion(signingOutError)
        }
    }
    
    func validateSignUp(email: String, password: String, password2: String) -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !password2.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6, password == password2 else {
            return false
        }
        return true
    }
    
    func validateSignIn(email: String, password: String) -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return false
        }
        return true
    }
}
