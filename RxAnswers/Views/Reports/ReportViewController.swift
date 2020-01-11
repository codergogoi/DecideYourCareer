//
//  ReportViewController.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/8/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ReportViewController: UIViewController {

    @IBOutlet weak var reportCollectionView: UICollectionView!
    @IBOutlet weak var lblNoreportMessage: UILabel!
    @IBOutlet weak var imgReportGraphView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapDownloadReport(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
