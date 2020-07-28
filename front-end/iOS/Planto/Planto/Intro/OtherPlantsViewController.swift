//
//  OtherPlantsViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/28/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class OtherPlantsViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet weak var lblWithName: UILabel!
    
    var plantName: String!
    var plantNameEN: String!
    var similarPlants: Array<String>!
    var similarPlantsEN: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To Do: 비슷한 식물 도출 결과 Collection View로 생성
        
        // 이름 부분 Bold 및 색상 적용
        let resultText = "\(plantName!)와 비슷한 다른 식물들이예요!"
        let attribute = NSMutableAttributedString(string: resultText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: Constants.Color.greenColor,
                               range: (resultText as NSString).range(of:plantName))
        attribute.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                               value: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.bold),
                               range: (resultText as NSString).range(of: plantName))
        lblWithName.attributedText = attribute
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.SegueName.selectPlant) {
            guard let nextVc = segue.destination as? CheckPlantViewController else { return }
            nextVc.plantName = plantName
            nextVc.plantNameEN = plantNameEN
        }
    }
    
    // - Mark: IBActions
    @IBAction func goToList(_ sender: UIButton) {
        // To Do: 목록 뷰 생성 후 호출
        let alert = UIAlertController(title: "To Do:",
                                      message: "목록 뷰 생성 후 호출", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

// - Mark: GridCell
class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNameEN: UILabel!
}

// - Mark: UICollectionViewDelegate
extension OtherPlantsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // To Do: 식물 이름 변경 후 CheckPlantVC 호출
        let alert = UIAlertController(title: "선택한 식물",
                                      message: "'\(similarPlants[indexPath.item])'이(가) 맞나요?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "응, 맞아", style: .default, handler: { action in
            // 식물 이름 변경 후 CheckPlantVC 호출
            self.plantName = self.similarPlants[indexPath.item]
            self.plantNameEN = self.similarPlantsEN[indexPath.item]
            self.performSegue(withIdentifier: Constants.SegueName.selectPlant, sender: self)
        })
        let cancelAction = UIAlertAction(title: "아니, 다시 고를래", style: .default, handler: nil)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}

// - Mark: UICollectionViewDataSource
extension OtherPlantsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarPlants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherPlants", for: indexPath) as? GridCell
            else { return UICollectionViewCell() }
        let image = UIImage(named: similarPlants[indexPath.item])
        cell.imgView.image = image
        cell.lblName.text = similarPlants[indexPath.item]
        cell.lblNameEN.text = similarPlantsEN[indexPath.item]
        return cell
        
    }
}

// - Mark: UICollectionViewDelegateFlowLayout
extension OtherPlantsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpace: CGFloat = 5
        
        let width: CGFloat = (collectionView.bounds.width - itemSpace) / 2
        let height: CGFloat = width * 1.5
        return CGSize(width: width, height: height)
    }
}
