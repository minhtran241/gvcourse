//
//  GVCoursesApp.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct GVCoursesApp: App {
    @AppStorage("signIn") var isSignIn = false
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if !isSignIn {
                SignInView().withErrorHandling()
            } else {
                GVCoursesTabView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}
