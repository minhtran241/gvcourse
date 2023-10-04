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
        NavigationStack {
            SearchBar(text: $store.searchText)
                .padding(.top, 20)
            List {
                ForEach(store.filteredCourses) {c in
                    CourseRow(name: c.name, credits: c.credits, title: c.title)
                }
            }
            .gvcoursesNavigationBar(
                title: "Hi Student!",
                subtitle: "Latest course news"
            )
            .listStyle(.plain)
            
        }
        .onAppear(perform: {store.refreshView()})
    }
}

#Preview {
    CoursesListView()
}
