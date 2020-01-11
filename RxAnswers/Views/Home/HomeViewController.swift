//
//  HomeViewController.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/8/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift


class HomeViewController : UIViewController {
    
    var userLogin: UserLogin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBarsOnTap = false
    }
    
    @IBAction func onTapStartTest(_ sender: Any) {
        self.performSegue(withIdentifier: "exam", sender: self)
    }
    
    @IBAction func onTapReport(_ sender: Any) {
        self.performSegue(withIdentifier: "report", sender: self)
    }
    
    @IBAction func onTapProfile(_ sender: Any) {
        self.performSegue(withIdentifier: "profile", sender: self)
    }
    
}
