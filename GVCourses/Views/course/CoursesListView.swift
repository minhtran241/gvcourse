//
//  CoursesListView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct CourseRow: View {
    let name: String
    let credits: Int
    let title: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name).foregroundStyle(.black)
                Text("\(credits) credits").font(.subheadline).foregroundStyle(.gray)
            }
            Spacer()
            Text(title).foregroundStyle(.gray)
        }
    }
}

struct CoursesListView: View {
    
    @EnvironmentObject var store: CourseStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.courseList) {c in
                    CourseRow(name: c.name, credits: c.credits, title: c.title)
                }
            }
            .gvcoursesNavigationBar(
                title: "Hi Student!",
                subtitle: "Latest course news"
            )
            .listStyle(InsetListStyle())
        }
        .onAppear(perform: {store.refreshView()})
    }
}

#Preview {
    CoursesListView()
}
