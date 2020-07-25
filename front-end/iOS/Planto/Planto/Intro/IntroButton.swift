//
//  IntroButtonDesign.swift
//  Planto
//
//  Created by Planto on 7/26/20.
//  Copyright © 2020 Planto. All rights reserved.
//

import UIKit

class IntroButton: UIButton{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        // 모서리
        self.layer.cornerRadius = 30.0
        
        // 그림자
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 30
        self.layer.shouldRasterize = true   // 그림자 캐시 저장
    }
}
