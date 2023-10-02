//
//  ContentView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct GVCoursesTabView: View {
    @StateObject var newsStore = NewsStore()
    @StateObject var courseStore = CourseStore()
    
    var body: some View {
        TabView {
            NewsListView().environmentObject(newsStore).tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            CoursesListView().environmentObject(courseStore).tabItem {
                Image(systemName: "list.bullet")
                Text("Courses")
            }
        }.accentColor(Color("brandPrimary"))
    }
}

#Preview {
    GVCoursesTabView()
}
