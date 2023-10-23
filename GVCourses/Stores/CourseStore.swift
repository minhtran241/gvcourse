//
//  CourseStore.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

class CourseStore: ObservableObject {
    
    @Published var courseList: [Course] = []
    @Published var searchText: String = ""
    private var dbManager = DatabaseManager.shared
    
    init() {
        DispatchQueue.main.async {
            self.refreshView()
        }
    }
    
    var filteredCourses: [Course] {
        guard !searchText.isEmpty else { return courseList }
        return courseList.filter { c in
            c.name!.lowercased().contains(searchText.lowercased())
            || c.title!.lowercased().contains(searchText.lowercased())
        }.sorted(by: { $0.createdAt! > $1.createdAt! } )
    }
    
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return [] }
        let fc = self.filteredCourses
        var suggestions: [String] = []
        for i in 0...4 {
            if i < fc.count {
                suggestions.append(fc[i].name!.trunc(length: 30))
                suggestions.append(fc[i].title!.lowercased().trunc(length: 30))
            }
        }
        return suggestions.sorted()
    }
    
    func refreshView(){
        self.courseList.removeAll()
        self.dbManager.getAllCourses { courses, error in
            if let error = error {
                print("Error fetching courses: \(error.localizedDescription)")
                return
            }
            self.courseList.append(contentsOf: courses!)
        }
    }
}
