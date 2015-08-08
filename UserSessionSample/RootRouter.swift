//
//  RootRouter.swift
//  UserSessionSample
//
//  Created by zen on 08/08/15.
//  Copyright (c) 2015 dimazen. All rights reserved.
//

import Foundation
import UIKit

class RootRouter {
    
    let userSessionController: UserSessionController
    let window: UIWindow
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private let navigationController = UINavigationController()
    
    init(userSessionController: UserSessionController, window: UIWindow) {
        self.userSessionController = userSessionController
        self.window = window
    }
    
    // mark: - Execution
    
    func execute() {
        let loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        loginViewController.didSelectLogin = { [unowned self] sender in
            self.executeLogin(sender)
        }
        
        navigationController.viewControllers = [loginViewController]
        
        if let restoredUserSession = userSessionController.restoreUserSession() {
            presentOpenedUserSession(restoredUserSession, animated: false)
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func executeLogin(sender: UIViewController) {
        userSessionController.openSession(username: "username", password: "password") { userSession, error in
            // always will be a non-nil object
            self.presentOpenedUserSession(userSession!, animated: true)
        }
    }
    
    private func executeLogout() {
        userSessionController.closeSession()
        navigationController.popToRootViewControllerAnimated(true)
    }
    
    private func presentOpenedUserSession(userSession: UserSession, animated: Bool) {
        let userSessionViewController = storyboard.instantiateViewControllerWithIdentifier("UserSessionViewController") as! UserSessionViewController

        userSessionViewController.userSession = userSession
        userSessionViewController.didSelectLogout = { [unowned self] sender in
            self.executeLogout()
        }
        
        navigationController.pushViewController(userSessionViewController, animated: animated)
     }
}