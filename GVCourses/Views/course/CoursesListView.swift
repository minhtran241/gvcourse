//
//  CoursesListView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct DetailedRow: View {
    let title: String
    var detail: String? = nil
    
    var body: some View {
        HStack() {
            Text(title)
            if detail?.isEmpty == false {
                Spacer()
                Text(detail!).foregroundColor(Color(.gray))
            }
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
            }
            .navigationTitle("Our courses")
            .listStyle(InsetListStyle())
        }
        .onAppear(perform: {store.refreshView()})
    }
}

#Preview {
    CoursesListView()
}
