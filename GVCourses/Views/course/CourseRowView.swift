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
            VStack(alignment: .leading) {
                Text(name).foregroundStyle(.black)
                Text("\(credits) credits").font(.subheadline).foregroundStyle(.gray)
            }
            Spacer()
            Text(title).foregroundStyle(.gray)
        }
    }
}

#Preview {
    CourseRowView(name: "CIS 357", credits: 3, title: "Mobile development")
}
