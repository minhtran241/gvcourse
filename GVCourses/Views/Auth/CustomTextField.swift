//
//  CustomTextField.swift
//  GVCourses
//
//  Created by Minh Tran on 11/10/2023.
//

import SwiftUI

struct CustomTextfield: View {
    var title: String
    @Binding var text: String
    var isPassword: Bool = false
    
    var body: some View {
        if (isPassword) {
            SecureInputView(title, text: $text)
        } else {
            TextField(title, text: $text)
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.brandPrimary)
                )
                .padding(.horizontal, 22)
                .padding(.vertical, 8)
                .textInputAutocapitalization(.never)
        }
    }
}

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text).textInputAutocapitalization(.never)
                } else {
                    TextField(title, text: $text).textInputAutocapitalization(.never)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }.padding(16)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.brandPrimary)
            )
            .padding(.horizontal, 22)
            .padding(.vertical, 8)
    }
}

struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(title: "Username", text: .constant(""))
    }
}
