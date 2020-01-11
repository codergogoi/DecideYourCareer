//
//  DesignableClasses.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/11/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


@IBDesignable
class BottomBorderView : UIView {
    
    @IBInspectable var bottomBorderWidth: CGFloat = 1.0
    @IBInspectable var bottomBorderColor: UIColor = UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10/255.0, alpha: 1.0)
    @IBInspectable var borderOpacity : Float = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override func draw(_ rect: CGRect) {
        
        let bottomLayer = CAShapeLayer()
        
        bottomLayer.frame = CGRect(x: 0, y: self.frame.size.height - bottomBorderWidth, width: self.frame.size.width, height: self.bottomBorderWidth)
        bottomLayer.backgroundColor = self.bottomBorderColor.cgColor
        bottomLayer.opacity = self.borderOpacity
        self.layer.addSublayer(bottomLayer)
        
    }
    
}

@IBDesignable
class RoundCornerButton : UIButton {
    
    @IBInspectable var buttonBGColor: UIColor = UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10/255.0, alpha: 1.0)
    @IBInspectable var buttonOpacity : Float = 1.0
    @IBInspectable var borderCorner: CGFloat = 5.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func draw(_ rect: CGRect) {
        
        self.layer.cornerRadius = self.borderCorner
        self.layer.backgroundColor = buttonBGColor.cgColor
        self.layer.opacity = self.buttonOpacity
        
    }
    
    
}

@IBDesignable
class BottomBorderTextField : UITextField {
    
    @IBInspectable var bottomBorderWidth: CGFloat = 1.0
    @IBInspectable var bottomBorderColor: UIColor = UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10/255.0, alpha: 1.0)
    @IBInspectable var borderOpacity : Float = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override func draw(_ rect: CGRect) {
        
        let bottomLayer = CAShapeLayer()
        
        bottomLayer.frame = CGRect(x: 0, y: self.frame.size.height - bottomBorderWidth, width: self.frame.size.width, height: self.bottomBorderWidth)
        bottomLayer.backgroundColor = self.bottomBorderColor.cgColor
        bottomLayer.opacity = self.borderOpacity
        self.layer.addSublayer(bottomLayer)
        
    }
}

@IBDesignable
class BottomBorderTextView : UITextView {
    
    @IBInspectable var bottomBorderWidth: CGFloat = 1.0
    @IBInspectable var bottomBorderColor: UIColor = UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10/255.0, alpha: 1.0)
    @IBInspectable var borderOpacity : Float = 1.0
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
     
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override func draw(_ rect: CGRect) {
        
        let bottomLayer = CAShapeLayer()
        
        bottomLayer.frame = CGRect(x: 0, y: self.frame.size.height - bottomBorderWidth, width: self.frame.size.width, height: self.bottomBorderWidth)
        bottomLayer.backgroundColor = self.bottomBorderColor.cgColor
        bottomLayer.opacity = self.borderOpacity
        self.layer.addSublayer(bottomLayer)
        
    }
}
