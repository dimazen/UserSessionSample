//
// Created by zen on 08/08/15.
// Copyright (c) 2015 dimazen. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var didSelectLogin: (UIViewController -> Void)?
    
    @IBAction
    private func login(sender: UIControl!) {
        didSelectLogin?(self)
    }
}
