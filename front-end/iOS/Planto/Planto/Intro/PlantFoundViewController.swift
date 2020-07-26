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

    override func viewDidLoad() {
        super.viewDidLoad()

        // 화면 전환
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "CheckPlant", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "CheckPlant") {
            guard let nextVc = segue.destination as? CheckPlantViewController else { return }
            nextVc.plantName = plantName
        }
    }
}
