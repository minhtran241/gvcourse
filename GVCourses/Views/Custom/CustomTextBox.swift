//
//  CútomTextBox.swift
//  GVCourses
//
//  Created by Minh Tran on 24/10/2023.
//

import Foundation
import SwiftUI

struct CustomTextBox: View {
    
    var systemSymbol: String
    var title: String
    var textBody: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: systemSymbol)
                Text("**\(title)**")
                Spacer()
            }
            Text(textBody)
        }
        .multilineTextAlignment(.leading)
        .font(.body)
        .foregroundColor(Color.primary.opacity(0.9))
        .padding(15)
        .background(
            Color.gray.opacity(0.3)
        )
        .cornerRadius(5)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
    }
}




