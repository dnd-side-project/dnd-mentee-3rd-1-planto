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

        // Do any additional setup after loading the view.
        print(plantName!)
    }
}
