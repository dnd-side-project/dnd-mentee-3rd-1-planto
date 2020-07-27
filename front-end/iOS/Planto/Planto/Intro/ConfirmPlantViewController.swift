//
//  CheckPlantViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/26/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class ConfirmPlantViewController: UIViewController {
    
    var plantName: String!
    var plantNameEN: String!
    
    @IBOutlet weak var lblPlantName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPlantName.text = "음, \(plantName!)와(과)"   // 레이블 텍스트
        
        // 이름 부분 Bold 및 적용
        let attribute = NSMutableAttributedString(string: lblPlantName.text!)
        attribute.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                               value: UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold),
                               range: (lblPlantName.text! as NSString).range(of: plantName!))
        lblPlantName.attributedText = attribute
        
        print(plantName!, plantNameEN!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "NamePlant") {
            guard let nextVc = segue.destination as? NamePlantViewController else {
                return
            }
            nextVc.plantName = plantName
            nextVc.plantNameEN = plantNameEN
        }
    }
    
    // 다시 고르기 버튼 클릭
    @IBAction func btnDismiss(_ sender: UIButton) {
        let alert = UIAlertController(title: "다시 고르기",
                                      message: "사진을 잘못 찍거나 선택하셨나요?",
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "응, 다시 고를래", style: .default, handler: {action in
            // TakePictureVC로 이동
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TakePictureVC")
                else {
                    return
            }
            self.present(vc, animated: true)
        })
        let cancelAction = UIAlertAction(title: "아니!", style: .default, handler: nil)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
}
