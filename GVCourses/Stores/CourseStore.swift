//
//  CourseStore.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

class CourseStore: ObservableObject {
    
    @Published var courseList: [Course] = []
    
    init() {
        DispatchQueue.main.async {
            self.refreshView()
        }
    }
    
    func refreshView(){
        self.courseList = []
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
                            rubricsURL: item.fields["rubricsURL"] as? String ?? "",
                            level: item.fields["level"] as! String,
                            transitionPlanURL: item.fields["transitionPlanURL"] as? String ?? "",
                            prerequisite: item.fields["prerequisite"] as? String ?? ""
                        )
                    )
                }
            }
        }
    }
}
