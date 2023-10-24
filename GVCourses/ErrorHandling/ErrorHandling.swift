//
//  ErrorHandling.swift
//  GVCourses
//
//  Created by Minh Tran on 23/10/2023.
//

import SwiftUI

class ErrorHandling: ObservableObject {
    @Published var currentAlert: ErrorAlert?

    func handle(error: Error) {
        currentAlert = ErrorAlert(message: error.localizedDescription)
    }
}
