//
//  GVCoursesNavigationBar.swift
//  GVCourses
//
//  Created by Minh Tran on 02/10/2023.
//

import SwiftUI

extension View {
    
    func gvcoursesNavigationBar(
        background: Color = Color("brandPrimary"),
        foreground: Color = Color(.white),
        title: String = "GVCourses"
    ) -> some View {
        return self
            .modifier(GVCoursesNavigationBar(
                background: background,
                foreground: foreground,
                title: title)
            )
    }
}

struct GVCoursesNavigationBar: ViewModifier {
    
    var background: Color
    var foreground: Color
    var title: String
    
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
                    Text(self.title).font(.headline)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        AuthManager.shared.signOut { error in
                            print("Error: \(error)")
                        }
                    }) {
                        Image(systemName: "power")
                            .foregroundStyle(.white)
                    }
                }
            }
            .foregroundStyle(self.foreground)
    }
}
