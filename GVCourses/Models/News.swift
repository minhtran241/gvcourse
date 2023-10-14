//
//  News.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import Foundation
import Contentful

struct News: Identifiable {
    var id: String
    var title: String
    var description: String
    var thumbnail: URL?
    var content: String
    var featured: Bool
    let createdAt: Date
    
    init(id: String, title: String, description: String, thumbnail: URL? = nil, content: String, featured: Bool = false, createdAt: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.content = content
        self.featured = featured
        self.createdAt = createdAt
    }
}

struct MockData {
    static let sampleNews = News(id: "123456", title: "New Course!", description: "This is new course", thumbnail: URL(string: "https://media.nature.com/lw800/magazine-assets/d41586-020-03053-2/d41586-020-03053-2_18533904.jpg"), content: "This is about the new course", createdAt: Date.now)
    static let news: [News] = [sampleNews, sampleNews, sampleNews, sampleNews]
}


