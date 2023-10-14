//
//  GVCoursesApp.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

@main
struct GVCoursesApp: App {
    var body: some Scene {
        WindowGroup {
            //            GVCoursesTabView()
            NavigationView{
                Login()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}
