//
//  NewsStore.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

class NewsStore: ObservableObject {
    
    @Published var newsList: [News] = []
    
    init() {
        DispatchQueue.main.async {
            self.refreshView()
        }
    }
    
    func refreshView(){
        self.newsList = []
        DispatchQueue.main.async {
            getAll(id: "news") {items in
                items.forEach {(item) in
                    self.newsList.append(
                        News(
                            title: item.fields["title"] as! String,
                            description: item.fields["description"] as! String,
                            thumbnail: item.fields.linkedAsset(at: "thumbnail")?.url ?? URL(string: ""),
                            content: item.fields["content"] as? String ?? "",
                            featured: item.fields["featured"] as? Bool ?? false
                        )
                    )
                }
            }
        }
    }
}

