//
//  CoursesListView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct CoursesListView: View {
    
    @EnvironmentObject var store: CourseStore
    
    var body: some View {
        NavigationStack {
            GVCoursesSearchBar(text: $store.searchTerm)
                .padding(.top, 20)
            List {
                ForEach(store.filteredCourses) {c in
                    ZStack(alignment:.leading) {
                        NavigationLink(destination: CourseDetailsView(course: c)) {
                            EmptyView()
                        }
                        .opacity(0)
                        CourseRowView(name: c.name!, credits: c.credits!, title: c.title!)
                    }
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .gvcoursesNavigationBar(
                title: "All courses"
            )
            .listStyle(InsetListStyle())
            .padding(.bottom, 80)
            
        }.refreshable {
            store.refreshView()
        }
    }
}

#Preview {
    CoursesListView()
}
