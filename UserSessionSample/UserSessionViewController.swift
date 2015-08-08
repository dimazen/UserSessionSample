//
//  UserSessionViewController.swift
//  UserSessionSample
//
//  Created by zen on 08/08/15.
//  Copyright (c) 2015 dimazen. All rights reserved.
//

import UIKit

class UserSessionViewController: UIViewController {

    @IBOutlet
    weak private var userSessionLabel: UILabel!
    
    var userSession: UserSession! {
        didSet {
            if isViewLoaded() {
                userSessionLabel.text = userSession.identifier
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userSessionLabel.text = userSession.identifier
    }
    
    var didSelectLogout: (UIViewController -> Void)?
    
    @IBAction
    private func logout(sender: UIControl!) {
        didSelectLogout?(self)
    }
}

