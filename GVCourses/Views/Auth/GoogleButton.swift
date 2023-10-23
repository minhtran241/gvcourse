//
//  GoogleButton.swift
//  GVCourses
//
//  Created by Minh Tran on 22/10/2023.
//

import Foundation
import SwiftUI

struct GoogleSiginBtn: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image("google") // Replace with your Google logo image
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Sign in with Google")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.white) // Set text color to black
                    .padding(.horizontal, 10)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.black) // Set the button's background to white
        .cornerRadius(8)
        .padding(.horizontal, 20)
    }
}

struct GoogleSiginBtn_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSiginBtn(action: {})
    }
}
