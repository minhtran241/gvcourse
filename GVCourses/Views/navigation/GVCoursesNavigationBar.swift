//
//  NavigationBar.swift
//  GVCourses
//
//  Created by Minh Tran on 02/10/2023.
//

import SwiftUI

extension View {
    
    func gvcoursesNavigationBar(
        background: Color = Color("brandPrimary"),
        foreground: Color = Color(.white),
        title: String = "GVCourses",
        subtitle: String = ""
    ) -> some View {
        return self
            .modifier(GVCoursesNavigationBar(
                background: background,
                foreground: foreground,
                title: title,
                subtitle: subtitle)
            )
    }
}

struct GVCoursesNavigationBar: ViewModifier {
    
    var background: Color
    var foreground: Color
    var title: String
    var subtitle: String?
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(
                self.background,
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if self.subtitle?.isEmpty == true {
                        Text(self.title).font(.headline)
                    } else {
                        VStack {
                            Text(self.title).font(.headline)
                            Text(self.subtitle!).font(.subheadline)
                        }
                    }
                }
            }
            .foregroundStyle(self.foreground)
    }
}
