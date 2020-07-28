//
//  ThirdIntroViewController.swift
//  Planto
//
//  Created by Planto on 7/26/20.
//  Copyright © 2020 Planto. All rights reserved.
//

import UIKit

class ThirdIntroViewController: UIViewController {

    // - MARK: IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 케릭터 회전
        imgView.transform = CGAffineTransform(rotationAngle: (-15.0 * .pi) / 180.0)
    }
    
    // - MARK: IBActions
    // 지금은 별로 버튼 클릭 시
    @IBAction func btnDecline(_ sender: UIButton) {
        alert("준비가 안 되셨군요!", message: "마음의 준비가 되면 다시 말씀해주세요!", actionTitle: "알겠어!")
    }
    
    func alert(_ title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
