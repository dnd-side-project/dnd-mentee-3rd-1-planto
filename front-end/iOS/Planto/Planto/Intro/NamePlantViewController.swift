//
//  NamePlantViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/26/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class NamePlantViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet weak var customName: UITextField!
    
    // CheckPlantVC로 부터 default name 받아옴
    var plantName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 화면 터치 시 키보드 숨기기
        self.view.endEditing(true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let des = segue.destination
//        
//        guard let nextVC = des as? ConfirmNameViewController else {
//            return
//        }
//        
//        (customName.text == "") ? (nextVC.customName = self.plantName ?? "") : (nextVC.customName = self.customName.text)
//    }
    
    // - MARK: IBActions
    @IBAction func gotoNextPressed(_ sender: UIButton) {
        if (customName.text == "") {
            let alert = UIAlertController(title: "이름이 필요해요",
                                          message: "이름을 다음에 지으시려면 '그냥 다음에 지을래'를 클릭해주세요.", preferredStyle: .alert)
            let action = UIAlertAction(title: "알겠어!", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            performSegue(withIdentifier: Constants.SegueName.confirmName, sender: self)
        }
    }
    
    
    @IBAction func nextTimePressed(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.SegueName.confirmName, sender: self)
    }
}
