//
//  User.swift
//  Planto
//
//  Created by Aaron Lee on 8/3/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import Foundation
import UIKit

class UserUtill {
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
    
    func saveUserDefaults(value: String, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    func loadUserDefaults(forKey: String) -> Any {
        return UserDefaults.standard.value(forKey: forKey) ?? ""
    }
    
    func saveAllUserDefaults(authenticatedFlag: Bool, autoLoginFlag: Bool, email: String, password: String) {
        UserDefaults.standard.set(authenticatedFlag, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(autoLoginFlag, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set(email, forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set(password, forKey: Constants.User.Info.Password.rawValue)
    }
    
    func resetAllUserDefaults() {
        UserDefaults.standard.set(false, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(false, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set("", forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set("", forKey: Constants.User.Info.NickName.rawValue)
        UserDefaults.standard.set("", forKey: Constants.User.Info.Password.rawValue)
    }
    
}
