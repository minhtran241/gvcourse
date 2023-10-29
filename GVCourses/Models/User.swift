//
//  User.swift
//  GVCourses
//
//  Created by Minh Tran on 24/10/2023.
//

import SwiftUI
import FirebaseFirestore

struct User: Identifiable {
    var id: String?
    var email: String?
    var providerID: String?
    var providerDataID: String?
    
    init(id: String? = nil, email: String? = nil, providerID: String? = nil, providerDataID: String? = nil) {
        self.id = id
        self.email = email
        self.providerID = providerID
        self.providerDataID = providerDataID
    }
    
    init() {
        self.id = nil
        self.email = nil
        self.providerID = nil
        self.providerDataID = nil
    }
}
