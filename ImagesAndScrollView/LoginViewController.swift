//
//  LoginViewController.swift
//  ImagesAndScrollView
//
//  Created by Harut on 11/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loginButton.setCornerRadius(dividingWidthBy: 9)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "tabBar" && usernameLabel.text == "h" && passwordLabel.text == "" {
            return true
        }
        return false
    }
}
