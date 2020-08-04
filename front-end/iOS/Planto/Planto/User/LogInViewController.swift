//
//  LogInViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    var isAutoLogin: Bool = false
    var isAuthenticated: Bool = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnAutoLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAutoLogin.isSelected = false
        User().testSave()
    }
}

// MARK: - IBActions
extension LogInViewController {
    @IBAction func toggleAutoLogin(_ sender: UIButton) {
        autoLoginToggle()
    }
    
    @IBAction func toggleAutoLoginText(_ sender: UIButton) {
        autoLoginToggle()
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let user = User()
        
        if (txtEmail.text == "" || txtPassword.text == "") {
            alert(message: "입력하시지 않은 정보가 있는지 확인해주세요")
        } else if (!user.isValidEmail(email: txtEmail.text ?? "")) {
            alert(message: "올바른 이메일이 맞는지 확인해주세요")
        } else if (!user.checkUser(email: txtEmail.text ?? "", password: txtPassword.text ?? "")) {
            // To Do: Request to Check User Info
            alert(message: "입력하신 정보가 올바른지 확인해주세요")
        } else {
            isAuthenticated = true
            saveUserInfo(authenticatedFlag: isAuthenticated,
                         autoLoginFlag: isAutoLogin,
                         email: txtEmail.text ?? "",
                         password: txtPassword.text ?? "")
            
            // To Do: Request Log In & Go to Prev VC
            user.testSave()
        }
    }
}

// MARK: - Functions
extension LogInViewController {
    func autoLoginToggle() {
        btnAutoLogin.isSelected = !btnAutoLogin.isSelected
        if (btnAutoLogin.isSelected == true) {
            isAutoLogin = true
        } else {
            isAutoLogin = false
        }
    }
    
    func alert(message: String) {
        let seconds: Double = 1.5
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.view.backgroundColor = UIColor.lightGray
        alertController.view.alpha = 0.5
        alertController.view.layer.cornerRadius = 15
        self.present(alertController, animated: true, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alertController.dismiss(animated: true, completion: nil)
        })
    }
    
    func saveUserInfo(authenticatedFlag: Bool, autoLoginFlag: Bool, email: String, password: String) {
        UserDefaults.standard.set(authenticatedFlag, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(autoLoginFlag, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set(email, forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set(password, forKey: Constants.User.Info.Password.rawValue)
    }
}
