//
//  ErrorAlert.swift
//  GVCourses
//
//  Created by Minh Tran on 23/10/2023.
//

import SwiftUI

struct ErrorAlert: Identifiable {
    var id = UUID()
    var message: String
    var dismissAction: (() -> Void)?
}
