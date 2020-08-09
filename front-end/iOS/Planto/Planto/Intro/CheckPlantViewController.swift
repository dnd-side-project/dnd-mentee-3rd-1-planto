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
    
    @IBOutlet weak var lblResult: UILabel!      // 검색 결과
    @IBOutlet weak var imgView: UIImageView!        // 이미지
    @IBOutlet weak var lblPlantNameKR: UILabel!     // 한글이름
    @IBOutlet weak var lblPlantNameEN: UILabel!     // 영어이름
    @IBOutlet weak var lblPlantDescription: UILabel!    // 설명
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이름 부분 Bold 및 색상 적용
        let resultText = "제가 보기에, 이 친구는 \(plantName!) 같네요!"
        let attribute = NSMutableAttributedString(string: resultText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: Constants.Color.greenColor,
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
//    
//    // 식물 이름 다음 뷰 전달
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "ConfirmPlant") {
//            guard let nextVc = segue.destination as? ConfirmPlantViewController else { return }
//            nextVc.plantName = plantName
//            nextVc.plantNameEN = plantNameEN
//        }
//        // To Do: 비슷한 식물 도출 후 결과 전송
//        if (segue.identifier == "OtherPlants") {
//            guard let nextVc = segue.destination as? OtherPlantsViewController else { return }
//            nextVc.plantName = plantName
//            nextVc.plantNameEN = plantNameEN
//            nextVc.similarPlants = ["스투키", "스투키", "스투키", "스투키"]
//            nextVc.similarPlantsEN = ["Stuckyi1", "Stuckyi2", "Stuckyi3", "Stuckyi4"]
//        }
//    }
    
}
