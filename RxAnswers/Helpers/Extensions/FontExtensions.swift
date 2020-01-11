//
//  FontExtensions.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/11/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

//Custom App Font
extension UIFont{
    
    
    class func appFont(fSize: Float) -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Regular", size: CGFloat(fSize))!
        
    }
    
    class func lblFont() -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Regular", size: 14)!
        
    }
    
    class func lblAppData() -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Regular", size: 17)!
        
    }
    
    class func appBoldFont(fSize: Float) -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Bold", size: CGFloat(fSize))!
        
    }
    
}
