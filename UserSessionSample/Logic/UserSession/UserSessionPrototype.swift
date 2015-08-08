//
// Created by zen on 08/08/15.
// Copyright (c) 2015 dimazen. All rights reserved.
//

import Foundation

struct UserSessionPrototype {

    let identifier: String
    let userInfo: [String: AnyObject]

    init(response: [String: AnyObject]) {
        // We've hacked parsing a little bit to simplify example
        let result = response["result"] as! [String: AnyObject]

        identifier = userData["id"] as! String
        userData = result["user"] as! [String: AnyObject]
    }
}
