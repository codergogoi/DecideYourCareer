//
//  RegisterViewModel.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/8/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct RegisterViewModel {
    
    let disposeBag = DisposeBag()

    var userLogin: UserLogin?
    let firstName = BehaviorRelay<String>.init(value: "")
    var lastName =  BehaviorRelay<String>.init(value: "")
    var parentName = BehaviorRelay<String>.init(value: "")
    var contactNumber = BehaviorRelay<String>.init(value: "")
    var emailId = BehaviorRelay<String>.init(value: "")
    var gender = BehaviorRelay<String>.init(value: "")
    var address = BehaviorRelay<String>.init(value: "")
    
    func onRegister(completion: @escaping(Bool) ->()){
        
        guard let userID = self.userLogin?.userId, let token = self.userLogin?.token else {
            return
        }
        
        let data: [String:  Any] = ["uid": userID, "first_name": firstName.value, "last_name": lastName.value, "parents_name": parentName.value, "contact_number": contactNumber.value, "email_id": emailId.value, "address": address.value, "gender": gender.value, "token": token]
                
        WebService().request(endPoint: "students/register", isPost: true, postData: data).subscribe(onNext: { (response: GenericResponse) in
            print(response)
            completion(true)
        }, onError: { (error) in
            print(error.localizedDescription)
            completion(false)
        }).disposed(by: disposeBag)
        
    }
    
}
