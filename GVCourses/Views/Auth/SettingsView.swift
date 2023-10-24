//
//  AccountView.swift
//  GVCourses
//
//  Created by Minh Tran on 24/10/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    
    @EnvironmentObject var errorHandling: ErrorHandling
    @EnvironmentObject var store: UserStore
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("**Email:** \((store.user?.email)!)")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .foregroundColor(Color.primary.opacity(0.9))
                        .padding(.bottom, 10)
                    Spacer()
                }.padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                
                HStack {
                    Text("**App Version:** 1.0.0")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .foregroundColor(Color.primary.opacity(0.9))
                        .padding(.bottom, 10)
                    Spacer()
                }.padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                
                HStack {
                    Text("**Provider ID:** \((store.user?.providerID)!)")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .foregroundColor(Color.primary.opacity(0.9))
                        .padding(.bottom, 10)
                    Spacer()
                }.padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                
                CustomButton(text: "Logout") {
                    // Perform logout action here
                    AuthManager.shared.signout()
                }.padding(.bottom, 10)
                
                HStack {
                    Button("Delete My Account", action: {
                        // Perform account deletion action here
                        self.store.deleteAndLogoutCurrentUser { error in
                            if let error = error {
                                // Handle the error, e.g., display an error message
                                print("Error deleting and logging out user: \(error.localizedDescription)")
                                errorHandling.handle(error: error)
                            } else {
                                // The user has been successfully deleted and logged out
                                print("User deleted and logged out.")
                            }
                        }
                    })
                    .foregroundColor(.red)
                    Spacer()
                }.padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .toolbar(.hidden, for: .tabBar)
            .gvcoursesNavigationBar(
                title: "Settings"
            )
            .frame(maxWidth: .infinity)
            .padding(.top, 15)
        }.refreshable {
            store.refreshView()
        }
    }
}

