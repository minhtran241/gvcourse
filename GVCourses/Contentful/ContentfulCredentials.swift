//
//  ContentfulClient.swift
//  GVCourses
//
//  Created by Minh Tran on 02/10/2023.
//

import SwiftUI
import Contentful

struct ContentfulCredentials {
    
    var spaceId: String
    var environmentId: String
    var accessToken: String
    
    init() {
        guard let bundleInfo = Bundle.main.infoDictionary else { fatalError() }
        self.spaceId = bundleInfo["CONTENTFUL_SPACE_ID"] as! String
        self.environmentId = bundleInfo["CONTENTFUL_ENVIRONMENT_ID"] as! String
        self.accessToken = bundleInfo["CONTENTFUL_ACCESS_TOKEN"] as! String
    }
}
