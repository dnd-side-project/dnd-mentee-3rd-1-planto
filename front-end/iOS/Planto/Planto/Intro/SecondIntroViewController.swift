//
//  SecondIntroViewController.swift
//  Planto
//
//  Created by Planto on 7/26/20.
//  Copyright © 2020 Planto. All rights reserved.
//

import UIKit

class SecondIntroViewController: UIViewController {

    @IBOutlet weak var lblGreetingWithName: UILabel!    // 토오라고 해요!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 케릭터 회전
        imgView.transform = CGAffineTransform(rotationAngle: (-15.0 * .pi) / 180.0)
        
        lblGreetingWithName.text = "토오라고 해요!"   // 레이블 텍스트
        
        // 이름 부분 Bold 적용
        let attribute = NSMutableAttributedString(string: lblGreetingWithName.text!)
        attribute.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                               value: UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold),
                               range: (lblGreetingWithName.text! as NSString).range(of: "토오"))
        lblGreetingWithName.attributedText = attribute
    }

}
