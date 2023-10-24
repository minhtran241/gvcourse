//
//  NewsDetailsView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseFirestore

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
                    
                    
                    HStack(spacing: 10) {
                        HStack(spacing: 5) {
                            Image(systemName: "clock.fill").font(.subheadline).foregroundColor(.gray)
                            Text(formatTimeSinceCreated(createdAt: news.createdAt!))
                                .font(.subheadline).foregroundStyle(.gray)
                        }
                        HStack(spacing: 5) {
                            Image(systemName: "bookmark.fill")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("newcourse")
                                .font(.subheadline).foregroundStyle(.gray)
                        }
                        Spacer()
                    }.padding(.horizontal, 15)
                    
                    VStack {
                        HStack {
                            Text(news.title!)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color("brandPrimary"))
                                .lineLimit(3)
                                .padding(.top, 5)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        
                        HStack {
                            Text(news.subtitle!)
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                                .foregroundColor(Color.primary.opacity(0.6))
                                .italic()
                                .padding(.bottom, 10)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text(news.description!)
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(15)
                                .background(
                                    Color.gray.opacity(0.3)
                                )
                                .cornerRadius(5)
                                .padding(.bottom, 10)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        
                        if (news.registerInstruction ?? "").isEmpty == false {
                            HStack {
                                Text("**Register:** \(news.registerInstruction!)")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 10)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (news.partnership ?? "").isEmpty == false {
                            HStack {
                                Text("**Partnership:** \(news.partnership!)")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                    }.padding(.horizontal, 15)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 80)
            }
            .toolbar(.hidden, for: .tabBar)
            .gvcoursesNavigationBar(
                title: "Course News"
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
//
//#Preview {
//    NewsDetailsView(news: MockData.sampleNews)
//}
