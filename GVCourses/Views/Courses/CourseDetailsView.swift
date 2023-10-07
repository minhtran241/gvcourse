//
//  CourseDetailsView.swift
//  GVCourses
//
//  Created by Minh Tran on 04/10/2023.
//

import SwiftUI
import Contentful

struct CourseDetailsView: View {
    
    @Environment(\.presentationMode) var presentation
    var course: Course
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            Text("\(course.name.uppercased()) - \(course.title.uppercased())")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("brandPrimary"))
                                .lineLimit(3)
                                .padding(.bottom, 15)
                                .padding(.top, 35)
                            Spacer()
                        }
.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text(try! (AttributedString(markdown: course.description)))
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 5)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("Level: \(course.level)")
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 2)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("Credits: \(course.credits)")
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 2)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        if (course.prerequisiteString ?? "").isEmpty == false {
                            HStack {
                                Text("Prerequisite: \(course.prerequisiteString!.toMarkdown())")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (course.rubricsUrl ?? "").isEmpty == false {
                            HStack {
                                Text("Rubrics: \("[\(course.name) Rubric](\(course.rubricsUrl!))".toMarkdown())")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (course.transitionPlanUrl ?? "").isEmpty == false {
                            HStack {
                                Text("Transition plan: \("[\(course.name) Transition Plan](\(course.transitionPlanUrl!))".toMarkdown())")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
            }
            .gvcoursesNavigationBar(
                title: course.name,
                subtitle: course.title.trunc(length: 30)
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

//#Preview {
//    CourseDetailsView()
//}
