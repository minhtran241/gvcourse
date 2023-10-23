//
//  DatabaseManager.swift
//  GVCourses
//
//  Created by Minh Tran on 23/10/2023.
//

import Foundation
import FirebaseFirestore

struct DatabaseManager {
    static let shared = DatabaseManager()
    
    private let db = Firestore.firestore()
    
    public func getAllNews(completion: @escaping ([News]?, Error?) -> Void) {
        db.collection("news").getDocuments { (snapshot, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            // Convert the data to an array of News objects
            let posts: [News] = snapshot?.documents.compactMap { document in
                let data = document.data()
                
                guard let id = document.documentID as? String,
                      let title = data["title"] as? String,
                      let subtitle = data["subtitle"] as? String,
                      let description = data["description"] as? String,
                      let thumbnail = data["thumbnail"] as? String,
                      let registerInstruction = data["registerInstruction"] as? String,
                      let partnership = data["partnership"] as? String,
                      let createdAt = data["createdAt"] as? Timestamp
                else {
                    print("Invalid post fetch conversion")
                    return News()
                }
                
                let post = News(id: id, title: title, subtitle: subtitle, description: description, thumbnail: URL(string: thumbnail), registerInstruction: registerInstruction, partnership: partnership, createdAt: createdAt.dateValue())
                return post
            } ?? []
            
            completion(posts, nil)
        }
    }
    
    public func getAllCourses(completion: @escaping ([Course]?, Error?) -> Void) {
        db.collection("courses").getDocuments { (snapshot, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            // Convert the data to an array of News objects
            let courses: [Course] = snapshot?.documents.compactMap { document in
                let data = document.data()
                
                guard let id = document.documentID as? String,
                      let number = data["number"] as? Int,
                      let subject = data["subject"] as? String,
                      let name = data["name"] as? String,
                      let title = data["title"] as? String,
                      let description = data["description"] as? String,
                      let credits = data["credits"] as? Int,
                      let rubricsUrl = data["rubricsUrl"] as? String,
                      let level = data["level"] as? String,
                      let transitionPlanUrl = data["transitionPlanUrl"] as? String,
                      let prerequisiteString = data["prerequisiteString"] as? String,
                      let createdAt = data["createdAt"] as? Timestamp
                else {
                    print("Invalid post fetch conversion")
                    return Course()
                }
                
                let course = Course(id: id, number: number, subject: subject, name: name, title: title, description: description, credits: credits, rubricsUrl: rubricsUrl, level: level, transitionPlanUrl: transitionPlanUrl, prerequisiteString: prerequisiteString, createdAt: createdAt.dateValue())
                return course
            } ?? []
            
            completion(courses, nil)
        }
    }
}
