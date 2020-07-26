//
//  CheckPlantViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/26/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class CheckPlantViewController: UIViewController {
    
    let plantName: String = "스투키"

    @IBOutlet weak var lblPlantName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPlantName.text = "음, \(plantName)와(과)"   // 레이블 텍스트
        
        // 이름 부분 Bold 적용
        let attribute = NSMutableAttributedString(string: lblPlantName.text!)
        attribute.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                               value: UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold),
                               range: (lblPlantName.text! as NSString).range(of: plantName))
        lblPlantName.attributedText = attribute
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "NamePlant") {
            guard let nextVc = segue.destination as? NamePlantViewController else {
                return
            }
            nextVc.plantName = plantName
        }
    }

    @IBAction func btnDismiss(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TakePictureVC") else {
            return
        }
        self.present(vc, animated: true)
    }
}
