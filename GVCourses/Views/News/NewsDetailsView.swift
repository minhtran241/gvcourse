//
//  NewsDetailsView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

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
                        HStack {
                            Text(news.title!.uppercased())
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(Color("brandPrimary"))
                                .lineLimit(3)
                                .padding(.bottom, 15)
                                .padding(.top, 15)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            Text(news.subtitle!.uppercased())
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .foregroundColor(Color.red)
                                .underline()
                                .padding(.bottom, 15)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text(news.description!)
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 15)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        
                        if (news.registerInstruction ?? "").isEmpty == false {
                            HStack {
                                Text(news.registerInstruction!)
                                    .multilineTextAlignment(.center)
                                    .font(.body)
                                    .foregroundColor(Color.red)
                                    .underline()
                                    .padding(.bottom, 15)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (news.partnership ?? "").isEmpty == false {
                            HStack {
                                Text("Partnership: \(news.partnership!)")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                    }.padding(.horizontal, 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 80)
            }
            .toolbar(.hidden, for: .tabBar)
            .gvcoursesNavigationBar(
                title: "Course News",
                subtitle: news.title!.trunc(length: 30)
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
