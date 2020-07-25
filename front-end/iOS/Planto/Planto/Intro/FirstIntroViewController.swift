//
//  ViewController.swift
//  Plento
//
//  Created by Planto on 7/19/20.
//  Copyright © 2020 Planto. All rights reserved.
//

import UIKit

class FirstIntroViewController: UIViewController {
    
    let delayTime: Double = 3   // Delay Time 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delayTime 초 후 다음 뷰 전환
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime, execute: {
            self.performSegue(withIdentifier: "SecondIntro", sender: self)
        })
    }
}

