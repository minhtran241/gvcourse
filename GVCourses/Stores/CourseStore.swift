//
//  CourseStore.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import FirebaseFirestore

class CourseStore: ObservableObject {
    
    private let db: Firestore
    private var ref: CollectionReference?
    private var listener: ListenerRegistration?
    @Published var courseList: [Course] = []
    @Published var searchText: String = ""
    @EnvironmentObject var errorHandling: ErrorHandling
    
    init() {
        self.db = Firestore.firestore()
        self.ref = self.db.collection("courses")
        self.registerForFirebaseUpdates()
        //        DispatchQueue.main.async {
        //            self.refreshView()
        //        }
    }
    
    var filteredCourses: [Course] {
        guard !searchText.isEmpty else { return courseList }
        return courseList.filter { c in
            c.name!.lowercased().starts(with:searchText.lowercased())
            || c.title!.lowercased().starts(with: searchText.lowercased())
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
        self.getAllCourses { courses, error in
            if let error = error {
                print("Error fetching news: \(error.localizedDescription)")
                self.errorHandling.handle(error: error)
                return
            }
            self.courseList.append(contentsOf: courses!)
        }
    }
    
    private func registerForFirebaseUpdates() {
        self.listener = self.ref?.addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!.localizedDescription)")
                self.errorHandling.handle(error: error!)
                return
            }
            
            // Update the @State variable on the main thread
            DispatchQueue.main.async {
                self.courseList = documents.compactMap { document in
                    return self.parseCourseDocument(document)
                }
            }
        }
    }
    
    private func getAllCourses(completion: @escaping ([Course]?, Error?) -> Void) {
        self.ref?.getDocuments { (snapshot, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            let posts: [Course] = snapshot?.documents.compactMap { document in
                return self.parseCourseDocument(document)
            } ?? []
            
            completion(posts, nil)
        }
    }
    
    func parseCourseDocument(_ document: QueryDocumentSnapshot) -> Course? {
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
            return nil
        }
        
        let course = Course(id: id, number: number, subject: subject, name: name, title: title, description: description, credits: credits, rubricsUrl: rubricsUrl, level: level, transitionPlanUrl: transitionPlanUrl, prerequisiteString: prerequisiteString, createdAt: createdAt.dateValue())
        return course
    }
}
