//
//  QuestionViewCell.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/11/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class QuestionViewCell: UICollectionViewCell {

    var didSelectOption:((String)->())?
    
    var dataModel: Question?{
        didSet{
            if let question = dataModel?.question{
                self.lblQuestion.text = question
            }
            if let option1 = dataModel?.option1{
                self.lblOption1.attributedText = self.setAttrText(option1)
            }
            if let option2 = dataModel?.option2{
                self.lblOption2.attributedText = self.setAttrText(option2)
            }
            if let option3 = dataModel?.option3{
                self.lblOption3.attributedText = self.setAttrText(option3)
            }
            if let option4 = dataModel?.option4{
                self.lblOption4.attributedText = self.setAttrText(option4)
            }
        }
    }
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblOption1: UILabel!
    @IBOutlet weak var lblOption2: UILabel!
    @IBOutlet weak var lblOption3: UILabel!
    @IBOutlet weak var lblOption4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeShadowView()
        self.lblQuestion.lineBreakMode = .byWordWrapping
        self.lblQuestion.numberOfLines = 0
        setupOnTapActions()
        
    }
    
    
    private func setAttrText(_ string: String)-> NSAttributedString{
        
        let attrString = NSMutableAttributedString()
        let attachment = NSTextAttachment(image: #imageLiteral(resourceName: "radio_normal"))
        attachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)
        attrString.append(NSAttributedString.init(attachment: attachment))
        attrString.append(NSAttributedString(string: " \(string)", attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize: 16)]))
        return attrString
    }
    
    private func setupOnTapActions(){
        var actions: [UILabel: Selector] = [:]
        actions[lblOption1] = #selector(onTapOption1)
        actions[lblOption2] = #selector(onTapOption2)
        actions[lblOption3] = #selector(onTapOption3)
        actions[lblOption4] = #selector(onTapOption4)
        self.addGesture(actions: actions)
    }
    
   func makeShadowView(){
        DispatchQueue.main.async {
            self.bgView.layer.masksToBounds = false
               self.bgView.layer.shadowColor = UIColor.darkGray.cgColor
               self.bgView.layer.shadowOpacity = 0.1
               self.bgView.layer.shadowOffset = CGSize(width: -1, height: 1)
               self.bgView.layer.shadowRadius = 10
                   
               self.bgView.layer.shadowPath = UIBezierPath(rect: self.bgView.bounds).cgPath
               self.bgView.layer.shouldRasterize = true
               self.bgView.layer.rasterizationScale = UIScreen.main.scale
                   
               self.bgView.layer.backgroundColor = UIColor.white.cgColor
               
               self.bgView.layer.cornerRadius = 2
               self.bgView.layer.borderWidth = 1
            self.bgView.layer.borderColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2).cgColor
        }
       
    }

    private func addGesture(actions: [UILabel: Selector]){
        _ = actions.map{
            $0.key.isUserInteractionEnabled = true
            $0.key.addGestureRecognizer(UITapGestureRecognizer(target: self, action: $0.value))
        }
    }
    
   @objc func onTapOption1(){
        self.lblOption1.onTapViewAnimation()
       
   }
   
   @objc func onTapOption2(){
       self.lblOption2.onTapViewAnimation()
       
   }
   
   @objc func onTapOption3(){
       
       self.lblOption3.onTapViewAnimation()
   }
   
   @objc func onTapOption4(){
       
       self.lblOption4.onTapViewAnimation()
   }
    
    
}
