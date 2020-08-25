//
//  LogInViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit
import Alamofire

class LogInViewController: UIViewController {
    
    let isAutoLogin: Bool = true
    var isAuthenticated: Bool = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonLoginDidTap(_ sender: UIButton) {
        let user = UserUtil()
        
        let email = txtEmail?.text ?? ""
        let password = txtPassword?.text ?? ""
        
        if (email == "" || password == "") {
            alert(message: "입력하시지 않은 정보가 있는지 확인해주세요")
        } else if (!user.isValidEmail(email: email)) {
            alert(message: "올바른 이메일이 맞는지 확인해주세요")
        } else {
            // TODO: Check User Info
            let params: [String: String] = [
                Constants.User.email: txtEmail.text!,
                Constants.User.password: txtPassword.text!
            ]
            AF.request(
                Constants.RestConfig.signInURL,
                method: .post,
                parameters: params,
                encoding: JSONEncoding.default
            ).responseJSON { (response) in
                if (response.error == nil) {
                    switch response.result {
                    case .success(_):
                        self.isAuthenticated = true
                        if let json = response.value as? [String: String] {
                            let token = json[Constants.User.token]
                            // [Save Auth Info]
                            UserUtil()
                                .saveAllUserDefaults(
                                    authenticatedFlag: self.isAuthenticated,
                                    autoLoginFlag: self.isAutoLogin,
                                    email: email,
                                    token: token ?? ""
                            )
                            self.alert(message: "환영해요!")
                        }
                    case .failure(_):
                        break
                    }
                } else {
                    print("--->fail: \(response.error as Any)")
                    self.alert(message: "입력하신 정보 확인 후 다시 시도해주세요.")
                }
            }
        }
    }
}

// MARK: - Methods
extension LogInViewController {
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
