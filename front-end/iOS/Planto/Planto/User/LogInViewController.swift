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
        
        updateUI()
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
            requestSignIn(params: params)
        }
    }
}

// MARK: - Methods
extension LogInViewController {
    func updateUI() {
        let authFlag = UserUtil().loadUserDefaults(forKey: Constants.User.Info.Authenticated.rawValue)
        if (authFlag as? Int != nil && authFlag as! Int == 1) {
            guard let nextVC = self
                .storyboard?.instantiateViewController(withIdentifier: "UserDetailVC")
                else { return }
            self.present(nextVC, animated: true)
        }
    }
    func requestSignIn( params : [String: String]) {
        AF.request(
            Constants.RestConfig.signInURL,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default)
            .responseJSON { (response) in
                if (response.error == nil) {
                    switch response.result {
                    case .success(_):
                        self.isAuthenticated = true
                        if let json = response.value as? [String: String] {
                            let token = json[Constants.User.token]
                            // [Save User Info]
                            UserUtil().saveAllUserDefaults(
                                authenticatedFlag: self.isAuthenticated,
                                autoLoginFlag: self.isAutoLogin,
                                email: self.txtEmail.text ?? "",
                                token: token ?? ""
                            )
                            // [Move to NextVC]
                            guard let nextVC = self
                                .storyboard?.instantiateViewController(withIdentifier: "UserDetailVC")
                                else { return }
                            self.present(nextVC, animated: true)
                        }
                    case .failure(_):
                        break
                    }
                } else {  // error
                    self.alert(message: "입력하신 정보 확인 후 다시 시도해주세요.")
                }
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
