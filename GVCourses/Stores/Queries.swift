//
//  Queries.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import Foundation
import Contentful

let spaceId = (Bundle.main.infoDictionary?["CONTENTFUL_SPACE_ID"] as? String)!
let environmentId = (Bundle.main.infoDictionary?["CONTENTFUL_ENVIRONMENT_ID"] as? String)!
let accessToken = (Bundle.main.infoDictionary?["CONTENTFUL_ACCESS_TOKEN"] as? String)!

// Retain the client as a property on a type you define so that
// the client's asynchronous network callbacks are executed.
let client = Client(spaceId: spaceId,
                    environmentId: environmentId, // Defaults to "master" if omitted
                    accessToken: accessToken)

func getAll(id: String, completion: @escaping([Entry]) -> ()) {
    print(client.spaceId)
    let query = Query.where(contentTypeId: id)
    try! query.order(by: Ordering(sys: .createdAt, inReverse: true))
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
    }
}
