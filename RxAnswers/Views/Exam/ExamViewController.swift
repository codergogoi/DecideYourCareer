//
//  ExamViewController.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/8/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ExamViewController: UIViewController {

    @IBOutlet private weak var questionsCollectionView: UICollectionView!
    
    let viewModel = ExamViewModel()

    private var myItems : PublishSubject<[Question]> = PublishSubject()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionsCollectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        setupBinding()
        viewModel.getQuestionPaper { (status) in
            self.myItems.onNext(self.viewModel.questions)
        }
    }

    private func setupBinding(){
        
        questionsCollectionView.register(UINib(nibName: "QuestionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: QuestionViewCell.self))
        myItems.bind(to: questionsCollectionView.rx.items(cellIdentifier: "QuestionViewCell", cellType: QuestionViewCell.self)){ (row, question, cell) in
            cell.dataModel = question
        }.disposed(by: disposeBag)
    
        questionsCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
    }

}

extension ExamViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 300)
    }
    
    
    
}
