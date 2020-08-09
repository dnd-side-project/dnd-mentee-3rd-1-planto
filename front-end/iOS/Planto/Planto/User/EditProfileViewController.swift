//
//  EditProfileViewController.swift
//  Planto
//
//  Created by Aaron Lee on 8/9/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtVerifyNewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadAndShowUserDefaults()
    }
    
    // MARK: - IBActions
    
    @IBAction func btnConfirmDidTap(_ sender: UIButton) {
        let user = UserUtil()
        
        let currentEmail = UserUtil()
            .loadUserDefaults(forKey: Constants.User.Info.Email.rawValue) as! String
        
        if (txtEmail.text == "" || txtNickName.text == "" || txtPassword.text == "") {
            alert(message: "입력하시지 않은 정보가 있는지 확인해주세요")
        } else if (txtNewPassword.text != txtVerifyNewPassword.text) {
            self.alert(message: "변경하실 비밀번호가 일치하는지 확인해주세요.")
        } else if (!user.isValidEmail(email: txtEmail.text ?? "")) {
            self.alert(message: "올바른 이메일이 맞는지 확인해주세요")
        } else if (!user.checkUser(email: currentEmail, password: txtPassword.text ?? "")) {
            self.alert(message: "기존 비밀번호를 확인해주세요")
        } else if (user.checkUser(email: currentEmail, password: txtNewPassword.text ?? "")) {
            self.alert(message: "기존 비밀번호와 새 비밀번호는 달라야해요")
        } else {
            requestEditProfile()
        }
    }
    
    // MARK: - Methods
    
    func loadAndShowUserDefaults() {
        let email = UserUtil().loadUserDefaults(forKey: Constants.User.Info.Email.rawValue)
        let nickName = UserUtil().loadUserDefaults(forKey: Constants.User.Info.NickName.rawValue)
        
        txtEmail.text = email as? String
        txtNickName.text = nickName as? String
    }
    
    func requestEditProfile() {
        // To Do: Request Edit Profile
        let status = 200
        
        if status == 200 {
            // [Check New Email and Save]
            if txtEmail.text != "" && UserUtil().isExistingEmail(email: txtEmail.text ?? "") {
                checkEmailChangedAndChange(newEmail: txtEmail.text ?? "")
            }
            // [Check New Password and Save]
            if txtNewPassword.text != "" && txtVerifyNewPassword.text != "" {
                UserUtil().saveUserDefaults(value: txtNewPassword.text ?? "",
                                             forKey: Constants.User.Info.Password.rawValue)
            }
            // [Save NickName]
            UserUtil().saveUserDefaults(value: txtNickName.text ?? "",
                                         forKey: Constants.User.Info.NickName.rawValue)
            // [Save User Info & Go to UserDetail VC]
            self.navigationController?.popViewController(animated: true)
        } else {
            alert(message: "관리자에게 문의해주세요")
        }
    }
    
    func checkEmailChangedAndChange(newEmail: String) {
        let userDefaultsEmail = UserUtil()
            .loadUserDefaults(forKey: Constants.User.Info.Email.rawValue) as! String
        
        if txtEmail.text != userDefaultsEmail {
            let isExistingEmail = UserUtil().isExistingEmail(email: newEmail)
            
            switch isExistingEmail {
            case false:
                // To Do: Request Change Email
                UserUtil().saveUserDefaults(value: newEmail,
                                             forKey: Constants.User.Info.Email.rawValue)
            default:
                alert(message: "이미 존재하는 이메일입니다")
            }
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
    
}
