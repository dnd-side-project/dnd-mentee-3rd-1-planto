//
//  LeaveServiceViewController.swift
//  Planto
//
//  Created by Aaron Lee on 8/8/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class LeaveServiceViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonLeaveServiceDidTap(_ sender: UIButton) {
        let email = UserDefaults.standard.value(
            forKey: Constants.User.Info.Email.rawValue) as! String
        let password = txtPassword.text
        
        showConfirmAlert(title: "정말 탈퇴하시겠어요?", message: "회원님의 정보는 탈퇴 즉시 삭제되니 주의하세요!",
                         confirmTitle: "응", cancelTitle: "아니") { action in
                            self.checkUserInfo(email: email, password: password ?? "")
        }
    }
    
    
    // MARK: - Methods
    
    func checkUserInfo(email: String, password: String) {
        let users = TempUsers().users
        
        // To Do: Check whether User Information is correct
        for user in users {
            if email == user["email"] && password == user["password"] {  // if it is
                showAlertAndMoveToIndex(message: "Success")
                // To Do: Request Delete User
            }
        }
    }
    
    
    func moveToIndex() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let indexVC = storyboard.instantiateViewController(withIdentifier: "FirstGreetingVC")
        
        UserUtill().resetAllUserDefaults()
        self.present(indexVC, animated: true)
    }
    
    func showConfirmAlert(title: String, message: String,
                          confirmTitle: String, cancelTitle: String,
                          confirmHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmTitle,
                                          style: .default,
                                          handler: confirmHandler)
        let cancelAction = UIAlertAction(title: cancelTitle,
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    func showAlertAndMoveToIndex(message: String) {
        let seconds: Double = 1.5
        
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.view.backgroundColor = UIColor.lightGray
        alertController.view.alpha = 0.5
        alertController.view.layer.cornerRadius = 15
        self.present(alertController, animated: true, completion: nil)
        
        // Dismiss Automatically
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alertController.dismiss(animated: true) {
                self.moveToIndex()
            }
        })
    }
    
    
}
