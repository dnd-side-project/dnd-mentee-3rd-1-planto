//
//  BeforeManagementViewController.swift
//  Planto
//
//  Created by 김호준 on 2020/07/28.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class BeforeManagementViewController: UIViewController {

    @IBOutlet weak var insertPlantName: UILabel! //식물 이름 bold 처리
    @IBOutlet weak var boldLabel: UILabel!  //식물 사전 bold 처리
    
    var myPlantName = ""
    let toBoldText = "식물 사전"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        insertPlantName.text = "\(myPlantName)의 관리법 안내서에요!"
        boldLabel.text = "안내서는 \(toBoldText)에서"
        
        makeBoldLabel(insertPlantName, myPlantName)
        makeBoldLabel(boldLabel, toBoldText)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: Constants.SegueName.howtoManage, sender: self)
        }
    }
    //HowToManage로 식물이름 넘겨주기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination
        
        guard let nextVC = des as? HowToManageViewController else {
            return
        }
        
        nextVC.myPlantName = myPlantName ?? ""
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
