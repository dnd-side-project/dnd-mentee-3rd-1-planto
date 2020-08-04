//
//  User.swift
//  Planto
//
//  Created by Aaron Lee on 8/3/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import Foundation

class User {
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
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
    
    func checkUser(email: String, password: String) -> Bool {
        // To Do: Request
        let users = TempUsers().users
        var isCorrect: Bool = false
        
        for user in users {
            if (user["email"] == email && user["password"] == password) {
                isCorrect = true
            }
        }
        return isCorrect
    }
    
    func testSave() {
        let userDefaults = UserDefaults.standard
        if let authenticated = userDefaults.value(forKey: Constants.User.Info.Authenticated.rawValue),
            let autoLogin = userDefaults.value(forKey: Constants.User.Info.AutoLogIn.rawValue),
            let email = userDefaults.value(forKey: Constants.User.Info.Email.rawValue),
            let nickname = userDefaults.value(forKey: Constants.User.Info.NickName.rawValue),
            let password = userDefaults.value(forKey: Constants.User.Info.Password.rawValue){
            print("---> Here starts")
            print("---> authenticated: \(authenticated as! Bool)")
            print("---> autologin: \(autoLogin as! Bool)")
            print("---> email: \(email as! String)")
            print("---> nickname: \(nickname as! String)")
            print("---> password: \(password as! String)")
            print("---> Here ended")
            print("--------------------")
        }
    }
}
