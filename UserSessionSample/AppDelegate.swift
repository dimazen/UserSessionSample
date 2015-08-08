//
//  AppDelegate.swift
//  UserSessionSample
//
//  Created by zen on 08/08/15.
//  Copyright (c) 2015 dimazen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let userSessionController = UserSessionController(userDefaults: NSUserDefaults.standardUserDefaults())

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if userSessionController.canRestoreUserSession {
            // lets restore it
        }  else {
            // we need to show login
        }

        return true
    }
}

