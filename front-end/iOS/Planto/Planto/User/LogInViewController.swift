//
//  LogInViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - Mutable Variables
    var isAutoLogin: Bool = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var btnAutoLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnAutoLogin.isSelected = false
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
}

// MARK: - Functions
extension LogInViewController {
    // Auto Login 여부 확인
    func autoLoginToggle() {
        btnAutoLogin.isSelected = !btnAutoLogin.isSelected
        if (btnAutoLogin.isSelected == true) {
            isAutoLogin = true
        } else {
            isAutoLogin = false
        }
        print(isAutoLogin)
    }
}
