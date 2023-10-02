//
//  News.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import Foundation
import Contentful

struct News: Identifiable, Decodable {
    var id = UUID()
    var title: String
    var description: String
    var thumbnail: URL?
    var content: String
    var featured = false
}

var newsList: [News] = []

struct MockData {
    static let sampleNews = News(title: "New Course!", description: "This is new course", thumbnail: URL(string: "https://media.nature.com/lw800/magazine-assets/d41586-020-03053-2/d41586-020-03053-2_18533904.jpg"), content: "This is about the new course")
    static let news: [News] = [sampleNews, sampleNews, sampleNews, sampleNews]
}


