//
//  JoinViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit
import Alamofire

class JoinViewController: UIViewController {
    
    var isAutoLogin: Bool = false
    var isAuthenticated = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - IBActions
extension JoinViewController {
    @IBAction func btnSubmit(_ sender: UIButton) {
        let user = UserUtil()
        
        if (txtEmail.text == "" || txtNickName.text == "" || txtPassword.text == "" || txtConfirmPassword.text == "") {
            alert(message: "입력하시지 않은 정보가 있는지 확인해주세요")
        } else if (txtPassword.text != txtConfirmPassword.text) {
            self.alert(message: "입력하신 비밀번호가 일치하는지 확인해주세요.")
        } else if (!user.isValidEmail(email: txtEmail.text ?? "")) {
            self.alert(message: "올바른 이메일이 맞는지 확인해주세요")
        } else if (user.isExistingEmail(email: txtEmail.text ?? "")) {
            self.alert(message: "존재하는 이메일입니다")
        } else {
            requestJoin()
        }
    }
}

// MARK: - Functions
extension JoinViewController {
    func requestJoin() {
        let params: [String: String] = [
            Constants.User.email: txtEmail.text!,
            Constants.User.username: txtNickName.text!,
            Constants.User.password: txtPassword.text!
        ]
        AF.request(
            Constants.RestConfig.joinURL,
            method: .post,
            parameters: params,
            encoder: URLEncodedFormParameterEncoder(destination: .httpBody)
        ).response { (response) in
            if !(response.error != nil) {  // success
                self.alert(message: "가입 성공!") {
                    self.navigationController?.popViewController(animated: true)
                }
            } else {  // error
                self.alert(message: "네트워크 상태를 확인 후 다시 시도해주세요.")
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
        
        // Dismiss Automatically
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alertController.dismiss(animated: true, completion: completion)
        })
    }
    
}
