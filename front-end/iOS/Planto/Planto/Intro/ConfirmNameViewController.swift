//
//  ConfirmNameViewController.swift
//  Planto
//
//  Created by 김호준 on 2020/07/27.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class ConfirmNameViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet weak var plantName: UILabel!
    
    var customName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        plantName.text = "\(customName ?? "")!"
    }
    
    // - MARK: IBActions
    @IBAction func renamePressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "이 이름이 아니야?",
                                      message: "이름을 다시 지으시겠어요?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "응, 다시 지을래", style: .default, handler: {action in
            // NamePlantVC로 이동
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlantFoundVC") else {
                return
            }
            self.present(vc, animated: true)
        })
        let cancelAction = UIAlertAction(title: "아니", style: .default, handler: nil)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
