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
    private var rootRouter: RootRouter!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        rootRouter = RootRouter(userSessionController: userSessionController, window: window!)
        rootRouter.execute()
        
        return true
    }
}

