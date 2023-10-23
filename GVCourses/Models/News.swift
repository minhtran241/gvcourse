//
//  News.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import Foundation

struct News: Identifiable {
    var id: String?
    var title: String?
    var subtitle: String?
    var description: String?
    var thumbnail: URL?
    var registerInstruction: String?
    var partnership: String?
    var featured: Bool?
    let createdAt: Date?
    
    init(id: String? = nil, title: String? = nil, subtitle: String? = nil, description: String? = nil, thumbnail: URL? = nil, registerInstruction: String? = nil, partnership: String? = nil, createdAt: Date?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.thumbnail = thumbnail
        self.registerInstruction = registerInstruction
        self.partnership = partnership
        self.createdAt = createdAt
    }
    
    init() {
        self.id = nil
        self.title = nil
        self.subtitle = nil
        self.description = nil
        self.thumbnail = nil
        self.registerInstruction = nil
        self.partnership = nil
        self.createdAt = nil
    }
}


