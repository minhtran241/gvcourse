//
//  NewsStore.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

class NewsStore: ObservableObject {
    
    @Published var newsList: [News] = []
    private var dbManager = DatabaseManager.shared
    
    init() {
        DispatchQueue.main.async {
            self.refreshView()
        }
    }
    
    func refreshView(){
        self.newsList.removeAll()
        self.dbManager.getAllNews { news, error in
            if let error = error {
                print("Error fetching news: \(error.localizedDescription)")
                return
            }
            self.newsList.append(contentsOf: news!)
        }
    }
}

