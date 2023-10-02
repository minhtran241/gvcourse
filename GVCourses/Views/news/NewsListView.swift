//
//  NewsListView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var store: NewsStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.newsList) {post in
                    NavigationLink(destination: NewsDetailsView(news: post)) {
                        NewsCardView(news: post)
                    }
                }
            }
            .navigationTitle("Explore new courses!")
            .listStyle(InsetListStyle())
        }
        .onAppear(perform: {store.refreshView()})
    }
}

#Preview {
    NewsListView()
}
