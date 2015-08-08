//
// Created by zen on 08/08/15.
// Copyright (c) 2015 dimazen. All rights reserved.
//

import Foundation

struct UserSessionPrototype {

    let identifier: String
    let userInfo: [String: AnyObject]

    init(response: [String: AnyObject]) {
        // Dirty parsing to simplify our example
        let result = response["result"] as! [String: AnyObject]
        let user = result["user"] as! [String: AnyObject]

        identifier = user["id"] as! String
        userInfo = user
    }
}
