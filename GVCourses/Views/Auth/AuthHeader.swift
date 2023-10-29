//
//  LoginHeader.swift
//  GVCourses
//
//  Created by Minh Tran on 22/10/2023.
//

import SwiftUI

struct AuthHeader: View {
    var body: some View {
        VStack {
            Image("gvsu_marktop_blue")
                .resizable()
                .aspectRatio(16/9, contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 200, height: (UIScreen.main.bounds.width - 200) * 0.5625)
                .padding(.vertical, 30)
        }
    }
}

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeader()
    }
}
