//
//  Email.swift
//  Planto
//
//  Created by Aaron Lee on 8/3/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import Foundation

class Email {
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
}
