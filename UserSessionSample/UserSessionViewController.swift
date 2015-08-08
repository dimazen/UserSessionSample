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
    
    private func updateVisibleState() {
        userSessionLabel.text = userSession?.identifier
        title = userSession?.identifier
    }
    
    var userSession: UserSession? {
        didSet {
            if isViewLoaded() {
                updateVisibleState()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateVisibleState()
    }
    
    var didSelectLogout: (UIViewController -> Void)?
    
    @IBAction
    private func logout(sender: UIControl!) {
        didSelectLogout?(self)
    }
}

