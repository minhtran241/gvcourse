//
//  Queries.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import Foundation
import Contentful


// Retain the client as a property on a type you define so that
// the client's asynchronous network callbacks are executed.
let client: Client = ContentfulClientProvider().client

func getAll(id: String, completion: @escaping([Entry]) -> ()) {
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

