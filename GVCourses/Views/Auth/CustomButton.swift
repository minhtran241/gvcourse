//
//  CustomButton.swift
//  GVCourses
//
//  Created by Minh Tran on 22/10/2023.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.white) // Set text color to black
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(.brandPrimary)
        .cornerRadius(8)
        .padding(.horizontal, 20)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Hello", action: {})
    }
}
