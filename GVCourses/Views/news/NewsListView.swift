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
        NavigationStack {
            List {
                ForEach(store.newsList) {post in
                    ZStack(alignment:.leading) {
                        NavigationLink(destination: NewsDetailsView(news: post)) {
                            EmptyView()
                        }.opacity(0)
                        NewsCardView(news: post)
                    }.listRowSeparator(.hidden)
                }
            }.padding(.top, 10)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Hi Student!").font(.headline)
                            Text("Latest course news").font(.subheadline)
                        }
                    }
                }
                .navigationBarBackground()
                .listStyle(InsetListStyle())
        }
        .onAppear(perform: {store.refreshView()})
    }
}

#Preview {
    NewsListView()
}
