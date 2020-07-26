//
//  NamePlantViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/26/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class NamePlantViewController: UIViewController {
    
    // CheckPlantVC로 부터 default name 받아옴
    var plantName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(plantName!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 화면 터치 시 키보드 숨기기
        self.view.endEditing(true)
    }
}
