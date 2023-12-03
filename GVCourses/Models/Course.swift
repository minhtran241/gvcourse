//
//  Course.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import Foundation

struct Course: Identifiable {
    let id: String?
    let number: Int?
    let subject: String?
    let name: String?
    let title: String?
    let description: String?
    let credits: Int?
    let rubricsUrl: String?
    let level: String?
    let transitionPlanUrl: String?
    let prerequisiteString: String?
    let createdAt: Date?
    
    init() {
        self.id = nil
        self.number = nil
        self.subject = nil
        self.name = nil
        self.title = nil
        self.description = nil
        self.credits = nil
        self.rubricsUrl = nil
        self.level = nil
        self.transitionPlanUrl = nil
        self.prerequisiteString = nil
        self.createdAt = nil
    }
    
    init(id: String, number: Int, subject: String, name: String, title: String, description: String, credits: Int, rubricsUrl: String?, level: String, transitionPlanUrl: String?, prerequisiteString: String?, createdAt: Date) {
        self.id = id
        self.number = number
        self.subject = subject.uppercased()
        self.name = name
        self.title = title
        self.description = description
        self.credits = credits
        self.rubricsUrl = rubricsUrl
        self.level = level.capitalized
        self.transitionPlanUrl = transitionPlanUrl
        self.prerequisiteString = prerequisiteString
        self.createdAt = createdAt
    }
}

