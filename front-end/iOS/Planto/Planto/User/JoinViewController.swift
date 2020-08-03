//
//  JoinViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {
    // MARK: - To Do:
    // ---> Request Creating a User to DB
    
    // MARK: - Variables
    var isAuthenticated = false
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Email().testSave()
    }
}

// MARK: - IBActions
extension JoinViewController {
    @IBAction func btnSubmit(_ sender: UIButton) {
        let email = Email()
       
        if (txtEmail.text == "" || txtNickName.text == "" || txtPassword.text == "" || txtConfirmPassword.text == "") {
            // Check Empty Text Field
            alert(title: "입력하신 정보를 확인해주세요", message: "입력하시지 않은 정보가 있는지 확인해주세요")
            
        } else if (txtPassword.text != txtConfirmPassword.text) {
            // Check Passwords
            self.alert(title: "비밀번호를 확인해주세요", message: "입력하신 비밀번호가 일치하는지 확인해주세요.")
            
        } else if (!email.isValidEmail(email: txtEmail.text ?? "")) {
            // Check Email Form
            self.alert(title: "이메일을 형식을 확인해주세요", message: "올바른 이메일이 맞는지 확인해주세요")
            
        } else if (email.isExistingEmail(email: txtEmail.text ?? "")) {
            // Check Existing Email
            self.alert(title: "존재하는 이메일입니다", message: "다른 이메일로 가입을 진행해주세요")
            
        } else {
            // Request Join & Login
            requestJoin()
            
        }
    }
}

// MARK: - Functions
extension JoinViewController {
    // Show Alert Function
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
    
    // To Do: Request creating a user on DB, and Log Them in
    func requestJoin() {
        var responseCode = 200
        
        if (responseCode == 200) {
            // Save Authentication Info on the Device
            saveUserInfo()
            
            // To Do: Request Log the Created User In
            Email().testSave()
        } else {
            alert(title: "서버에 문제가 있어요", message: "관리자에게 문의해주세요")
        }
    }
    
    func saveUserInfo() {
        // Save Authentication Info on the Device using UserDefaults
        UserDefaults.standard.set(true, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(true, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set(txtEmail.text, forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set(txtNickName.text, forKey: Constants.User.Info.NickName.rawValue)
        UserDefaults.standard.set(txtPassword.text, forKey: Constants.User.Info.Password.rawValue)
    }
}
