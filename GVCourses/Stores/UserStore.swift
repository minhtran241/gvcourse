//
//  UserStore.swift
//  GVCourses
//
//  Created by Minh Tran on 24/10/2023.
//

import SwiftUI
import FirebaseAuth

class UserStore: ObservableObject {
    
    @Published var user: User?
    @EnvironmentObject var errorHandling: ErrorHandling
    
    init() {
        self.refreshView()
    }
    
    func refreshView(){
        self.getCurrentUser { user in
            self.user = user
        }
    }
    
    func deleteAndLogoutCurrentUser(completion: @escaping (Error?) -> Void) {
        deleteCurrentUser { deleteError in
            if let deleteError = deleteError {
                // Handle the user deletion error
                completion(deleteError)
            } else {
                // The user has been successfully deleted, now log them out
                AuthManager.shared.signOut() { error in
                    self.errorHandling.handle(error: error)
                }
            }
        }
    }
    
    private func deleteCurrentUser(completion: @escaping (Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            // The user is not logged in, handle this case as needed
            completion(nil)
            return
        }
        
        user.delete { error in
            if let error = error {
                // An error occurred while deleting the user
                completion(error)
            } else {
                // The user has been successfully deleted
                completion(nil)
            }
        }
    }
    
    private func getCurrentUser(completion: @escaping (User?) -> Void) {
        guard let currUser = Auth.auth().currentUser else {
            print("User is not logged in.")
            completion(nil)
            return
        }
        let user = User(id: currUser.uid, email: currUser.email, providerID: currUser.providerID, providerDataID: currUser.providerData[0].providerID)
        completion(user)
    }
}
