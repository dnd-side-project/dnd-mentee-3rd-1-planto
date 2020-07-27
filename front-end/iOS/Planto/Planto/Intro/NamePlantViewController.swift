//
//  NamePlantViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/26/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class NamePlantViewController: UIViewController {
    
    @IBOutlet weak var customName: UITextField!
    // CheckPlantVC로 부터 default name 받아옴
<<<<<<< HEAD
    var plantName: String?
    
=======
    var plantName: String!
    var delegate: SendDataDelegate?
>>>>>>> acbd83c91a869afab4c45d622137f0def2fb417c

    override func viewDidLoad() {
        super.viewDidLoad()

<<<<<<< HEAD
=======
        print(plantName!, plantNameEN!)
>>>>>>> acbd83c91a869afab4c45d622137f0def2fb417c
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 화면 터치 시 키보드 숨기기
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination
        
        guard let nextVC = des as? ConfirmNameViewController else {
            return
        }
        (customName.text == nil) ? (nextVC.customName = self.plantName ?? "") : (nextVC.customName = self.customName.text)
    }
    @IBAction func gotoNextPressed(_ sender: UIButton) {
        
    }
}
