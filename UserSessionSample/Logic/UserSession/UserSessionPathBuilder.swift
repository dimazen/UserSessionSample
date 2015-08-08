//
// Created by zen on 08/08/15.
// Copyright (c) 2015 dimazen. All rights reserved.
//

import Foundation

class UserSessionPathBuilder {

    private let identifier: String
    init(userSession: UserSession) {
        identifier = userSession.identifier
    }

    private func pathForDirectory(directory: NSSearchPathDirectory) -> String {
        let directory = NSSearchPathForDirectoriesInDomains(directory, .UserDomainMask, true).first as! String
        return directory.stringByAppendingPathComponent("user_session")
    }

    // ~/Documents/user_session/identifier/
    func documentDirectory() -> String {
        return pathForDirectory(.DocumentDirectory).stringByAppendingPathComponent(identifier)
    }

    // ~/Library/Caches/user_session/identifier/
    func cachesDirectory() -> String {
        return pathForDirectory(.CachesDirectory).stringByAppendingPathComponent(identifier)
    }
}
