//
//  User.swift
//  Planto
//
//  Created by Aaron Lee on 8/3/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import Foundation
import UIKit

class UserUtil {
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
    
    func decode(_ token: String) -> [String: AnyObject]? {
        let string = token.components(separatedBy: ".")
        let toDecode = string[1] as String


        var stringtoDecode: String = toDecode.replacingOccurrences(of: "-", with: "+") // 62nd char of encoding
        stringtoDecode = stringtoDecode.replacingOccurrences(of: "_", with: "/") // 63rd char of encoding
        switch (stringtoDecode.utf16.count % 4) {
        case 2: stringtoDecode = "\(stringtoDecode)=="
        case 3: stringtoDecode = "\(stringtoDecode)="
        default: // nothing to do stringtoDecode can stay the same
            print("")
        }
        let dataToDecode = Data(base64Encoded: stringtoDecode, options: [])
        let base64DecodedString = NSString(data: dataToDecode!, encoding: String.Encoding.utf8.rawValue)

        var values: [String: AnyObject]?
        if let string = base64DecodedString {
            if let data = string.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: true) {
                values = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject]
            }
        }
        return values
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
    
    func saveAllUserDefaults(authenticatedFlag: Bool, autoLoginFlag: Bool, email: String, token: String) {
        UserDefaults.standard.set(authenticatedFlag, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(autoLoginFlag, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set(email, forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set(token, forKey: Constants.User.Info.Token.rawValue)
    }
    
    func resetAllUserDefaults() {
        UserDefaults.standard.set(false, forKey: Constants.User.Info.Authenticated.rawValue)
        UserDefaults.standard.set(false, forKey: Constants.User.Info.AutoLogIn.rawValue)
        UserDefaults.standard.set("", forKey: Constants.User.Info.Email.rawValue)
        UserDefaults.standard.set("", forKey: Constants.User.Info.NickName.rawValue)
        UserDefaults.standard.set("", forKey: Constants.User.Info.Password.rawValue)
    }
    
    func testSaveUserDefaults() {
        let isAuthenticated = loadUserDefaults(forKey: Constants.User.Info.Authenticated.rawValue)
        let isAutoLogIn = loadUserDefaults(forKey: Constants.User.Info.AutoLogIn.rawValue)
        let email = loadUserDefaults(forKey: Constants.User.Info.Email.rawValue)
        let nickName = loadUserDefaults(forKey: Constants.User.Info.NickName.rawValue)
        let token = loadUserDefaults(forKey: Constants.User.Info.Token.rawValue)
        
        print("---> isAuthenticated: \(isAuthenticated)")
        print("---> isAutoLogIn: \(isAutoLogIn)")
        print("---> email: \(email)")
        print("---> nickName: \(nickName)")
        print("---> token: \(token)")
    }
    
}
