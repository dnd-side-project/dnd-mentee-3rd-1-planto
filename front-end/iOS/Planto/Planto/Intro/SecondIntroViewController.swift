//
//  SecondIntroViewController.swift
//  Planto
//
//  Created by Planto on 7/26/20.
//  Copyright © 2020 Planto. All rights reserved.
//

import UIKit

class SecondIntroViewController: UIViewController {

    @IBOutlet weak var lblGreetingWithName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblGreetingWithName.text = "토오라고 해요!"   // 레이블 텍스트
        
        // 이름 부분 Bold 적용
        let attribute = NSMutableAttributedString(string: lblGreetingWithName.text!)
        attribute.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                               value: UIFont.boldSystemFont(ofSize: 22), range: (lblGreetingWithName.text! as NSString).range(of: "토오"))
        lblGreetingWithName.attributedText = attribute
    }

}
