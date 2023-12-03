//
//  CourseRowView.swift
//  GVCourses
//
//  Created by Minh Tran on 04/10/2023.
//

import SwiftUI

struct CourseRowView: View {
    let name: String
    let credits: Int
    let title: String
    
    var body: some View {
        HStack {
            Text(name).foregroundStyle(.black)
            Spacer()
            Group {
                Text(title).foregroundStyle(.gray) +
                Text("(\(credits))").foregroundColor(Color(.brandPrimary))
            }
        }
    }
}

#Preview {
    CourseRowView(name: "CIS 357", credits: 3, title: "Mobile development")
}
