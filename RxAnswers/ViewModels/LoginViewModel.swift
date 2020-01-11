//
//  LoginViewModel.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/7/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel {
    
    let userId = BehaviorRelay<String>.init(value: "")
    let userPassword = BehaviorRelay<String>.init(value: "")
    
    let bag  = DisposeBag()
    
    private var userLogin: UserLogin?
    
    func performLogin(completion: @escaping( _ status: Bool, _ isActive: Bool ) -> ()){
        
        let postData: [String: Any] = ["login_id": userId.value, "activate_code": userPassword.value, "action": "user-login"]
        WebService().request(endPoint: "login", isPost: true, postData: postData).subscribe(onNext: { (response: LoginResponse) in
            self.userLogin = response.data
            UserDefaults.standard.set("\(response.data.token)", forKey: "token")
            UserDefaults.standard.synchronize()
            completion(true, self.isActive())
            
        }, onError: { (error) in
            completion(false, false)
        }, onCompleted: {
            print("on Completed")
        }).disposed(by: bag)
        
    }
    
    func currentUser() ->  UserLogin?{
        return self.userLogin
    }
    
    func isActive() -> Bool {
        guard let status = self.userLogin?.isActive else {
            return false
        }
        return status
    }
    
    
    
}
