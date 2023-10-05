//
//  CourseDetailsView.swift
//  GVCourses
//
//  Created by Minh Tran on 04/10/2023.
//

import SwiftUI
import Contentful
import RichTextRenderer

struct CourseDetailsView: View {
    
    var course: Course
    @State var richTextDocument: RichTextDocument?
    
    private var richTextViewController: RichTextViewController {
        var configuration = DefaultRendererConfiguration()
        //            configuration.resourceLinkBlockViewProvider = ExampleBlockViewProvider()
        //            configuration.resourceLinkInlineStringProvider = ExampleInlineStringProvider()
        
        let renderersProvider = DefaultRenderersProvider()
        
        let renderer = RichTextDocumentRenderer(
            configuration: configuration,
            nodeRenderers: renderersProvider
        )
        
        return RichTextViewController(renderer: renderer)
    }
    
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
                            Text(course.description)
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 15)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("Level: \(course.level)")
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 15)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("Credits: \(course.credits)")
                                .multilineTextAlignment(.leading)
                                .font(.body)
                                .foregroundColor(Color.primary.opacity(0.9))
                                .padding(.bottom, 15)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("Test: ")
                            SwiftUIRichTextView(
                                richTextViewController: richTextViewController,
                                richTextDocument: course.test
                            )
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            .foregroundColor(Color.primary.opacity(0.9))
                            .padding(.bottom, 15)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        if let p = course.prerequisiteString {
                            HStack {
                                Text("Prerequisite: \(p)")
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundColor(Color.primary.opacity(0.9))
                                    .padding(.bottom, 25)
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
