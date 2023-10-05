//
//  CoursesListView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct CoursesListView: View {
    
    @EnvironmentObject var store: CourseStore
    @Environment(\.searchSuggestionsPlacement) var placement
    
    var body: some View {
        NavigationStack {
            GVCoursesSearchBar(text: $store.searchText)
                .padding(.top, 20)
            if placement == .content {
                ForEach(store.filteredSuggestions, id: \.self) { suggestion in
                    Button {
                        store.searchText = suggestion
                    } label: {
                        Label(suggestion, systemImage: "bookmark")
                    }
                }
            }
            List {
                ForEach(store.filteredCourses) {c in
                    ZStack(alignment:.leading) {
                        NavigationLink(destination: CourseDetailsView(course: c)) {
                            EmptyView()
                        }
                        .opacity(0)
                        CourseRowView(name: c.name, credits: c.credits, title: c.title)
                    }
                }
            }
            .gvcoursesNavigationBar(
                title: "Hi Student!",
                subtitle: "Latest course news"
            )
            .listStyle(.automatic)
            
        }
        .onAppear(perform: {store.refreshView()})
    }
}

#Preview {
    CoursesListView()
}
