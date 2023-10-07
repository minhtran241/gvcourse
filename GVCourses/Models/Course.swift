//
//  Course.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import Foundation
import Contentful

struct Course: Identifiable {
    let id = UUID()
    let number: Int
    let subject: String
    let name: String
    let title: String
    let description: String
    let credits: Int
    let rubricsUrl: String?
    let level: String
    let transitionPlanUrl: String?
    let prerequisite: String?
    let prerequisiteString: String?
    let createdAt: Date
    
    init(number: Int, subject: String, name: String, title: String, description: String, credits: Int, rubricsUrl: String?, level: String, transitionPlanUrl: String?, prerequisite: String?, prerequisiteString: String?, createdAt: Date) {
        self.number = number
        self.subject = subject.uppercased()
        self.name = name
        self.title = title
        self.description = description
        self.credits = credits
        self.rubricsUrl = rubricsUrl
        self.level = level.capitalized
        self.transitionPlanUrl = transitionPlanUrl
        self.prerequisite = prerequisite
        self.prerequisiteString = prerequisiteString
        self.createdAt = createdAt
    }

}

struct CourseResponse {
     
}
