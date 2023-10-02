//
//  NavigationBar.swift
//  GVCourses
//
//  Created by Minh Tran on 02/10/2023.
//

import SwiftUI

extension View {
    func navigationBarBackground(_ background: Color = Color("brandPrimary"), _ foreground: Color = Color(.white)) -> some View {
        return self
            .modifier(ColoredNavigationBar(background: background, foreground: foreground))
    }
}

struct ColoredNavigationBar: ViewModifier {
    var background: Color
    var foreground: Color
    
    func body(content: Content) -> some View {
        content
            .toolbarBackground(
                background,
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar).foregroundStyle(foreground)
    }
}
