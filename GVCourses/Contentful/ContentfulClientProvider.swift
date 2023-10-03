//
//  ContentfulClientProvider.swift
//  GVCourses
//
//  Created by Minh Tran on 03/10/2023.
//

import Contentful

struct ContentfulClientProvider {
    var client: Client
    
    init() {
        let credentials: ContentfulCredentials = ContentfulCredentials()
        self.client = Client(
            spaceId: credentials.spaceId,
            environmentId: credentials.environmentId,
            accessToken: credentials.accessToken
        )
    }
}
