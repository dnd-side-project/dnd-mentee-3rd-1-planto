//
//  LogInViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - Variables
    var isAutoLogin: Bool = false
    var isAuthenticated: Bool = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnAutoLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnAutoLogin.isSelected = false
        Email().testSave()
    }
}

// MARK: - IBActions
extension LogInViewController {
    // Auto Login 체크 박스
    @IBAction func toggleAutoLogin(_ sender: UIButton) {
        autoLoginToggle()
    }
    
    // Auto Login 텍스트 버튼
    @IBAction func toggleAutoLoginText(_ sender: UIButton) {
        autoLoginToggle()
    }
    
    // Login Button
    @IBAction func btnLogin(_ sender: UIButton) {
        let email = Email()
        
        if (txtEmail.text == "" || txtPassword.text == "") {
            alert(title: "입력하신 정보를 확인해주세요", message: "입력하시지 않은 정보가 있는지 확인해주세요")
        } else if (!email.isValidEmail(email: txtEmail.text ?? "")) {
            alert(title: "이메일을 형식을 확인해주세요", message: "올바른 이메일이 맞는지 확인해주세요")
        } else if (!email.checkUser(email: txtEmail.text ?? "", password: txtPassword.text ?? "")) {
            // To Do: Request to Check User Info
            alert(title: "입력하신 정보를 확인해주세요", message: "입력하신 정보가 올바른지 확인해주세요")
        } else {
            // Set Flag
            isAuthenticated = true
            
            // Save User Info
            saveUserInfo(authenticatedFlag: isAuthenticated,
                         autoLoginFlag: isAutoLogin,
                         email: txtEmail.text ?? "",
                         password: txtPassword.text ?? "")
            
            // To Do: Request Log In & Go to Prev VC
            email.testSave()
        }
    }
}

// MARK: - Functions
extension LogInViewController {
    // Auto Login Toggle
    func autoLoginToggle() {
        btnAutoLogin.isSelected = !btnAutoLogin.isSelected
        if (btnAutoLogin.isSelected == true) {
            isAutoLogin = true
        } else {
            isAutoLogin = false
        }
    }
    
    // Alert
    func alert(title: String, message: String) {
        let seconds: Double = 1.5
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.backgroundColor = UIColor.lightGray
        alertController.view.alpha = 0.5
        alertController.view.layer.cornerRadius = 15
        self.present(alertController, animated: true, completion: nil)
        
        // Dismiss Automatically
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alertController.dismiss(animated: true, completion: nil)
        })
    }
    
    // Check Toggled Auto Login
    func saveUserInfo(authenticatedFlag: Bool, autoLoginFlag: Bool, email: String, password: String) {
        UserDefaults.standard.set(authenticatedFlag, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(autoLoginFlag, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set(email, forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set(password, forKey: Constants.User.Info.Password.rawValue)
    }
}
