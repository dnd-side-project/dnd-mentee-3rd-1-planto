//
//  CheckPlantViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/27/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class CheckPlantViewController: UIViewController {
    
    var plantName: String!
    var plantNameEN: String!
    
    let greenColor = UIColor(red: 85/255, green: 144/255, blue: 121/255, alpha: 1)
    
    @IBOutlet weak var lblResult: UILabel!      // 검색 결과
    @IBOutlet weak var imgView: UIImageView!        // 이미지
    @IBOutlet weak var lblPlantNameKR: UILabel!     // 한글이름
    @IBOutlet weak var lblPlantNameEN: UILabel!     // 영어이름
    @IBOutlet weak var lblPlantDescription: UILabel!    // 설명
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultText = "제가 보기에, 이 친구는 \(plantName!) 같네요!"
        
        // 이름 부분 Bold 및 색상 적용
        let attribute = NSMutableAttributedString(string: resultText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: greenColor,
                               range: (resultText as NSString).range(of:plantName))
        attribute.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                               value: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.bold),
                               range: (resultText as NSString).range(of: plantName))
        lblResult.attributedText = attribute
        
        // img view
        imgView.image = UIImage(named: "\(plantName!).png")
        
        // plantName & description
        lblPlantNameKR.text = plantName
        lblPlantNameEN.text = plantNameEN
        // To Do: DB와 이름 대조 후 설명 호출
        lblPlantDescription.text = "스투키(Sansevieria stuckyi 또는 Diocletian's spear)는 적도 아프리카에 자생하는 놀리나아과 식물의 다육 식물의 하나로, 경작이 쉬운 편이다."
        
    }
    
    // 식물 이름 다음 뷰 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
<<<<<<< HEAD
        if (segue.identifier == Constants.SegueName.namePlant) {
            guard let nextVc = segue.destination as? NamePlantViewController else {
                return
            }
=======
        if (segue.identifier == "ConfirmPlant") {
            guard let nextVc = segue.destination as? ConfirmPlantViewController else { return }
>>>>>>> acbd83c91a869afab4c45d622137f0def2fb417c
            nextVc.plantName = plantName
            nextVc.plantNameEN = plantNameEN
        }
    }
    
    
    @IBAction func btnCancel(_ sender: UIButton) {
        let alert = UIAlertController(title: "To Do",
                                      message: "식물 목록 생성 후 보여주는 창 호출",
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "산 넘어",
                                          style: .default,
                                          handler: nil)
        let cancelAction = UIAlertAction(title: "산",
                                         style: .default,
                                         handler: nil)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
