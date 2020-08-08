//
//  UserDetailViewController.swift
//  Planto
//
//  Created by Aaron Lee on 8/8/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblNickName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadUserInformation()
    }
    
    func loadUserInformation() {
        // To Do: Request & Show User Information
        let users = TempUsers().users
        let userDefaults = UserDefaults.standard
        let email = userDefaults.value(forKey: Constants.User.Info.Email.rawValue) as! String
        
        for user in users {
            if user["email"] == email {
                lblEmail.text = user["email"]
                lblNickName.text = user["userName"]
            }
        }
        
        
    }

}
