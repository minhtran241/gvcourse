//
//  NewsDetailsView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI
import MarkdownUI

struct NewsDetailsView: View {
    
    @Environment(\.presentationMode) var presentation
    var news: News
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    WebImage(url: news.thumbnail)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 310)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .clipped()
                    
                    VStack {
                        Markdown(news.content)
                            .markdownTheme(.gitHub)
                            .padding(.horizontal, 20)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 80)
            }
            .toolbar(.hidden, for: .tabBar)
            .gvcoursesNavigationBar(
                title: "Course News",
                subtitle: news.title.trunc(length: 30)
            ).navigationBarBackButtonHidden(true)
                .toolbar(content: {
                    ToolbarItem (placement: .navigation)  {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .onTapGesture {
                                // code to dismiss the view
                                self.presentation.wrappedValue.dismiss()
                            }
                    }
                })
        }
    }
}

#Preview {
    NewsDetailsView(news: MockData.sampleNews)
}
