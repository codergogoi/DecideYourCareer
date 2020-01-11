//
//  ViewExtensions.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/11/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


extension UIView {
    
    func onTapViewAnimation(){

        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
            
        }
        
    }
}

