//
//  NewsStore.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import FirebaseFirestore

class NewsStore: ObservableObject {
    
    private let db: Firestore
    private var ref: CollectionReference?
    private var listener: ListenerRegistration?
    @Published var newsList: [News] = []
    @EnvironmentObject var errorHandling: ErrorHandling
    
    init() {
        self.db = Firestore.firestore()
        self.ref = self.db.collection("news")
        self.registerForFirebaseUpdates()
        //        DispatchQueue.main.async {
        //            self.refreshView()
        //        }
    }
    
    func refreshView(){
        self.newsList.removeAll()
        self.getAllNews { news, error in
            if let error = error {
                print("Error fetching news: \(error.localizedDescription)")
                self.errorHandling.handle(error: error)
                return
            }
            self.newsList.append(contentsOf: news!)
        }
    }
    
    func parseNewsDocument(_ document: QueryDocumentSnapshot) -> News? {
        let data = document.data()
        
        guard let id = document.documentID as? String,
              let title = data["title"] as? String,
              let subtitle = data["subtitle"] as? String,
              let description = data["description"] as? String,
              let thumbnail = data["thumbnail"] as? String,
              let thumbnailURL = URL(string: thumbnail),
              let registerInstruction = data["registerInstruction"] as? String,
              let partnership = data["partnership"] as? String,
              let createdAt = data["createdAt"] as? Timestamp
        else {
            print("Invalid post fetch conversion")
            return nil
        }
        
        return News(id: id, title: title, subtitle: subtitle, description: description, thumbnail: thumbnailURL, registerInstruction: registerInstruction, partnership: partnership, createdAt: createdAt.dateValue())
    }
    
    private func registerForFirebaseUpdates() {
        self.listener = self.ref?.addSnapshotListener { [self] (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!.localizedDescription)")
                self.errorHandling.handle(error: error!)
                return
            }
            
            // Update the @State variable on the main thread
            DispatchQueue.main.async {
                self.newsList = documents.compactMap { document in
                    return self.parseNewsDocument(document)
                }
            }
        }
    }
    
    private func getAllNews(completion: @escaping ([News]?, Error?) -> Void) {
        self.ref?.getDocuments { (snapshot, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            let posts: [News] = snapshot?.documents.compactMap { document in
                return self.parseNewsDocument(document)
            } ?? []
            
            completion(posts, nil)
        }
    }
    
}

