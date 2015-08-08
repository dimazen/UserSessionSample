//
// Created by zen on 08/08/15.
// Copyright (c) 2015 dimazen. All rights reserved.
//

import Foundation

class UserSession {

    let identifier: String // to uniquely identify session
    private let sessionPrototype: UserSessionPrototype?

    // MARK: - Init

    init(prototype: UserSessionPrototype) {
        identifier = prototype.identifier // any hashing function such as sha1 can be added here
        sessionPrototype = prototype
    }

    init?(restorationIdentifier identifier: String) {
        self.identifier = identifier
        sessionPrototype = nil

        let canRestore = true // check whether session for passed identifier can be successfuly restored or not
        if !canRestore {
            return nil
        }
    }

    // MARK: - State

    enum State {
        case Undefined, Opened, Closed, Invalid
    }

    private(set) var state: State = .Undefined

    func open() -> Bool {
        precondition(state == .Undefined)

        if let prototype = sessionPrototype where !bootstrapFromPrototype(prototype) {
            state = .Invalid
            return false
        }

        // point to start any related services

        state = .Opened

        return true
    }

    func close() {
        precondition(state == .Opened || state == .Invalid)
        // point to stop any related services

        state = .Closed
    }

    // MARK: - Bootstrapping

    private func bootstrapFromPrototype(prototype: UserSessionPrototype) -> Bool {
        // map user data to a new user, setup db, etc

        return true // bootstrap completed successfuly
    }
}