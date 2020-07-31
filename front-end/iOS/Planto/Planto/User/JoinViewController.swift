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
    // ---> iCloud KeyChain
    // ---> Request creating a user to DB
    
    // MARK: - Variables
    var isAuthenticated = false
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testSave()
    }
    
    
}

// MARK: - IBActions
extension JoinViewController {
    @IBAction func btnSubmit(_ sender: UIButton) {
        // txtEmail Correction Default Keyboard 에러로 인해 => None 처리
        
        if (txtEmail.text == "" || txtNickName.text == "" || txtPassword.text == "" || txtConfirmPassword.text == "") {
            // Check Empty Text Field
            alert(title: "입력하신 정보를 확인해주세요", message: "입력하시지 않은 정보가 있는지 확인해주세요")
            
        } else if (txtPassword.text != txtConfirmPassword.text) {
            // Check Passwords
            self.alert(title: "비밀번호를 확인해주세요", message: "입력하신 비밀번호가 일치하는지 확인해주세요.")
            
        } else if (!isValidEmail(email: txtEmail.text ?? "")) {
            // Check Email Form
            self.alert(title: "이메일을 형식을 확인해주세요", message: "올바른 이메일이 맞는지 확인해주세요")
            
        } else if (isExistingEmail(email: txtEmail.text ?? "")) {
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
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "알겠어", style: .default, handler: nil)
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
    
    // Email Form Regex Check
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // Check Existing Email
    func isExistingEmail(email: String) -> Bool {
        let users = TempUsers().users
        let email = email
        var isExisting: Bool = false
        
        for user in users {
            if (email == user["email"]!) {
                isExisting = true
            }
        }
        
        return isExisting
    }
    
    // To Do: Request creating a user on DB, and Log Them in
    func requestJoin() {
        // Save Authentication Info on the Device using UserDefaults
        UserDefaults.standard.set(true, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(true, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set(txtEmail.text, forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set(txtPassword.text, forKey: Constants.User.Info.Password.rawValue)
        
        // To Do: 보안 대책 찾기(Password)
    }
    
    func testSave() {
        let userDefaults = UserDefaults.standard
        if let authenticated = userDefaults.value(forKey: Constants.User.Info.Authenticated.rawValue),
            let autoLogin = userDefaults.value(forKey: Constants.User.Info.AutoLogIn.rawValue),
            let email = userDefaults.value(forKey: Constants.User.Info.Email.rawValue),
            let password = userDefaults.value(forKey: Constants.User.Info.Password.rawValue){
            print("---> Here starts")
            print("---> authenticated: \(authenticated as! Bool)")
            print("---> autologin: \(autoLogin as! Bool)")
            print("---> email: \(email as! String)")
            print("---> password: \(password as! String)")
            print("---> Here ended")
        }
    }
}
