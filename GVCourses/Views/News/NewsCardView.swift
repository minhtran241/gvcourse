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
        HStack {
            WebImage(url: news.thumbnail)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 4)
            VStack(alignment: .leading, spacing: 5) {
                Text(news.title!)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brandPrimary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                Text(news.createdAt!, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

//#Preview {
//    NewsCardView()
//}
