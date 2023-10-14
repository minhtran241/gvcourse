//
//  NewsListView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsListView: View {
    
    @EnvironmentObject var store: NewsStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.newsList) {news in
                    NavigationLink(destination: NewsDetailsView(news: news), label: {
                        NewsCardView(news: news)
                    }
                    )
                    NavigationLink(destination: NewsDetailsView(news: news), label: {
                        NewsCardView(news: news)
                    }
                    )
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .gvcoursesNavigationBar(
                title: Date.getCurrentDate(),
                subtitle: "Latest Course News"
            )
            .listStyle(InsetListStyle())
            .padding(.bottom, 80)
        }.refreshable {
            store.refreshView()
        }
        //        .onAppear(perform: {store.refreshView()})
    }
}

#Preview {
    NewsListView()
}
