//
//  CoursesListView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct DetailedRow: View {
    let title: String
    var detail: String
    
    var body: some View {
        HStack() {
            Text(title).foregroundStyle(Color("brandPrimary"))
            Spacer()
            Text(detail).foregroundStyle(Color(.gray))
        }
    }
}

struct CoursesListView: View {
    
    @EnvironmentObject var store: CourseStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.courseList) {c in
                    DetailedRow(title: c.name, detail: c.title)
                }
            }.padding(.top, 10)
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
