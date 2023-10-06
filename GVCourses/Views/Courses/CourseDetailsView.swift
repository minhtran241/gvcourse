//
//  CourseDetailsView.swift
//  GVCourses
//
//  Created by Minh Tran on 04/10/2023.
//

import SwiftUI
import Contentful

struct CourseDetailsView: View {
    
    var course: Course
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            Text("\(course.name) - \(course.title)")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("brandPrimary"))
                                .lineLimit(3)
                                .padding(.vertical, 15)
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
                                Text(try! "Prerequisite: \(AttributedString(markdown: course.prerequisiteString!))")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (course.rubricsUrl ?? "").isEmpty == false {
                            HStack {
                                Text(try! "Rubrics: \(AttributedString(markdown: "[\(course.name) Rubric](\(course.rubricsUrl!))"))")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 2)
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                        
                        if (course.transitionPlanUrl ?? "").isEmpty == false {
                            HStack {
                                Text(try! "Transition plan: \(AttributedString(markdown: "[\(course.name) Transition Plan](\(course.transitionPlanUrl!))"))")
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    CourseDetailsView()
//}
