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
        let userToken = UserUtil().loadUserDefaults(forKey: Constants.User.Info.Token.rawValue)
        let decodedToken = UserUtil().decode(userToken as! String)
        if decodedToken != nil {
            let email = decodedToken![Constants.User.email] as! String
            let nickName = decodedToken![Constants.User.username] as! String
            lblEmail.text = email
            lblNickName.text = nickName
        }
    }
    func alert(message: String, completion: (() -> Void)? = nil) {
        let seconds: Double = 1.5
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.view.backgroundColor = UIColor.lightGray
        alertController.view.alpha = 0.5
        alertController.view.layer.cornerRadius = 15
        self.present(alertController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alertController.dismiss(animated: true, completion: completion)
        })
    }

}
