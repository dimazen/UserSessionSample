//
// Created by zen on 08/08/15.
// Copyright (c) 2015 dimazen. All rights reserved.
//

import Foundation

class AuthorizationAPIClient {

    func loginWithUsername(username: String, password: String, completion: (UserSessionPrototype?, NSError?) -> Void) {
        dispatch_async(dispatch_get_main_queue()) {

            let userId = String(format: "%08x", NSUUID().UUIDString.hash)
            let json: [String: AnyObject] = [
                "result": [
                    "user": [
                        "id": userId,
                        "email": "\(userId)_foo@bar.com",
                        "name": "Foo Bar"
                    ]
                ]
            ]

            completion(UserSessionPrototype(response: json), nil)
        }
    }
}
