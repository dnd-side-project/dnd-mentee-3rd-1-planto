//
//  HowToManageViewController.swift
//  Planto
//
//  Created by 김호준 on 2020/07/28.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class HowToManageViewController: UIViewController {

    @IBOutlet weak var insertPlantName: UILabel!
    
    var myPlantName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertPlantName.text = "\(myPlantName)은"
        makeBoldLabel(insertPlantName, myPlantName)
    }
    
    
    //Label을 Bold 처리 해주는 함수
    func makeBoldLabel(_ label: UILabel, _ str: String) {
        let attribute = NSMutableAttributedString(string: label.text!)
        attribute.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                               value: UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold),
                               range: (label.text! as NSString).range(of: str))
        label.attributedText = attribute
    }

}
