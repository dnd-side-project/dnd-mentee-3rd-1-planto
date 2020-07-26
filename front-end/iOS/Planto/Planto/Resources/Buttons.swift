//
//  IntroButtonDesign.swift
//  Planto
//
//  Created by Planto on 7/26/20.
//  Copyright © 2020 Planto. All rights reserved.
//

import UIKit

class WideButton: UIButton {
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

class CircleButton: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        // 모서리
        self.layer.cornerRadius = 25.0   // 버튼 크기가 50*50 일 때 동그라미
    }
}
