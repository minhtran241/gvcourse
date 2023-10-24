//
//  CourseDetailsView.swift
//  GVCourses
//
//  Created by Minh Tran on 04/10/2023.
//

import SwiftUI

struct CourseDetailsView: View {
    
    @Environment(\.presentationMode) var presentation
    var course: Course
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            Text("\(course.name!.uppercased()) - \(course.title!.uppercased())")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("brandPrimary"))
                                .lineLimit(3)
                                .padding(.vertical, 15)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        CustomTextBox(systemSymbol: "questionmark.bubble.fill", title: "What this course is about", textBody: course.description!)
                        
                        HStack {
                            Text("**Level:** \(course.level ?? "Undergraduate")")
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 2)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("**Credits:** \(course.credits ?? 3)")
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 2)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        if (course.prerequisiteString ?? "").isEmpty == false {
                            HStack {
                                Text("**Prerequisite:** \(course.prerequisiteString!.toMarkdown())")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (course.rubricsUrl ?? "").isEmpty == false {
                            HStack {
                                Text("**Rubrics:** \("[\(course.name ?? "") Rubric](\(course.rubricsUrl!))".toMarkdown())")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (course.transitionPlanUrl ?? "").isEmpty == false {
                            HStack {
                                Text("**Transition plan:** \("[\(course.name ?? "") Transition Plan](\(course.transitionPlanUrl!))".toMarkdown())")
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
                .padding(.bottom, 80)
            }
            .toolbar(.hidden, for: .tabBar)
            .gvcoursesNavigationBar(
                title: course.name!            
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
