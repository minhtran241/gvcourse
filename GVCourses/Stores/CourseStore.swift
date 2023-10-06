//
//  CourseStore.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import Contentful

class CourseStore: ObservableObject {
    
    @Published var courseList: [Course] = []
    @Published var searchText: String = ""
    
    var filteredCourses: [Course] {
        guard !searchText.isEmpty else { return courseList }
        return courseList.filter { c in
            c.name.lowercased().contains(searchText.lowercased())
            || c.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return [] }
        let fc = self.filteredCourses
        var suggestions: [String] = []
        for i in 0...4 {
            if i < fc.count {
                suggestions.append(fc[i].name.trunc(length: 30))
                suggestions.append(fc[i].title.lowercased().trunc(length: 30))
            }
        }
        return suggestions.sorted()
    }
    
    func refreshView(){
        self.courseList.removeAll()
        DispatchQueue.main.async {
            getAll(id: "gvCourse") {items in
                items.forEach {(item) in
                    self.courseList.append(
                        Course(
                            number: item.fields["number"] as! Int,
                            subject: item.fields["subject"] as! String,
                            name: item.fields["name"] as! String,
                            title: item.fields["title"] as! String,
                            description: item.fields["description"] as! String,
                            credits: item.fields["credits"] as! Int,
                            rubricsUrl: item.fields["rubricsUrl"] as? String ?? "",
                            level: item.fields["level"] as! String,
                            transitionPlanUrl: item.fields["transitionPlanUrl"] as? String ?? "",
                            prerequisite: item.fields["prerequisite"] as? String ?? "",
                            prerequisiteString: item.fields["prerequisiteString"] as? String ?? ""                        )
                    )
                }
            }
        }
    }
}
