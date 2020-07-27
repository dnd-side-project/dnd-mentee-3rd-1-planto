//
//  PlantFoundViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/26/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class PlantFoundViewController: UIViewController {
    
    var plantName: String!
    var plantNameEN: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 화면 전환 + 지연시간 2초
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: Constants.SegueName.checkPlant, sender: self)
        }
    }
    
    // 이름 다음 뷰로 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.SegueName.checkPlant) {
            guard let nextVc = segue.destination as? CheckPlantViewController else { return }
            nextVc.plantName = plantName
            nextVc.plantNameEN = plantNameEN
        }
    }
}
