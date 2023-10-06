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
//    let createdAt: Date
}

struct CourseResponse {
     
}
