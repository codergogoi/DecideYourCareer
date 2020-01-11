//
//  ExamViewModel.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/8/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ExamViewModel {
    
    var questions: [Question] = []
    
    private let disposeBag = DisposeBag()
    
    func getQuestionPaper(completion: @escaping(Bool) ->()){
        
        WebService().request(endPoint: "questions/paper/11").subscribe(onNext: { (paperResponse: QuestionResponse) in
            
            self.questions = paperResponse.data.paper
            print(self.questions)

            completion(true)
            
        }, onError: { (error) in
            print(error)
        }).disposed(by: disposeBag)
        
    }
    
}
