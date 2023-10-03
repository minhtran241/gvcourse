//
//  NewsCardMain.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsCardView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var screenWidth = UIScreen.main.bounds.size.width
    
    var news: News
    
    var body: some View {
        ZStack {
            WebImage(url: news.thumbnail)
                .resizable()
                .scaleEffect(2.5)
                .blur(radius: 40)
                .cornerRadius(10)
                .frame(maxWidth: (screenWidth - 10))
                .frame(maxHeight: 250)
                .opacity(0.7)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(news.createdAt, style: .date)
                                .font(.footnote)
                                .fontWeight(.light)
                                .shadow(radius: 6)
                            Spacer()
                        }
                        Text(news.title).font(.title2).bold()
                        Text(news.description)
                            .font(.footnote).italic()
                            .fontWeight(.light)
                            .shadow(radius: 6)
                            .bold()
                        Spacer()
                    }.padding(.top)
                    Spacer()
                }
                .padding(.leading)
                .frame(maxWidth: (screenWidth - 20))
                .frame(height: 120)
                .shadow(radius: 12)
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    WebImage(url: news.thumbnail)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: (screenWidth - 30))
                        .frame(height: 150)
                        .cornerRadius(5)
                        .shadow(radius: 12)
                }
                Spacer()
            }.padding(.bottom, 15)
        }
    }
}

#Preview {
    NewsCardView(news: MockData.sampleNews)
}
