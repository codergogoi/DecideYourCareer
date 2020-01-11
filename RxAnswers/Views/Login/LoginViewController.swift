//
//  LoginViewController.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/7/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    var viewModel = LoginViewModel()
    
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("", forKey: "token")
        txtUserId.rx.text.orEmpty.bind(to: viewModel.userId).disposed(by: disposeBag)
        txtPassword.rx.text.orEmpty.bind(to: viewModel.userPassword).disposed(by: disposeBag)
        
        let userID = txtUserId.rx.text.map{ text in
            return self.isValidUserId(userId: text)
        }

        let password = txtPassword.rx.text.map { text in
            return self.isValidPassword(password: text)
        }

        _ = Observable.combineLatest(userID, password){ $0 && $1}.bind(to: btnLogin.rx.isEnabled)
        
    }
    
    private func isValidUserId(userId: String?) -> Bool{
    
        if let userId = userId{
            if userId.count > 2{
                return true
            }
        }
        
        return false
    }
    
    private func isValidPassword(password: String?) -> Bool {
    
        if let password = password{
          if password.count > 2{
              return true
          }
      }
        return false
    }
    
    @IBAction func onTapLogin(_ sender: Any) {
       
        self.viewModel.performLogin {[weak self] (status, isActive) in
            if status{
                if isActive {
                    self?.gotoHome()
                }else{
                    self?.gotoRegister()
                }
            }else{
                self?.loginFailed()
            }
        }
    }
    
    private func gotoRegister(){
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "register", sender: self)
        }
    }
    
    private func gotoHome(){
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "home", sender: self)
        }
    }
    
    private func loginFailed(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "profile"{
            if let destination = segue.destination as? HomeViewController {
                destination.userLogin = self.viewModel.currentUser()
            }
        }else if segue.identifier  == "register" {
            if let destination = segue.destination as? RegisterViewController {
                destination.viewModel.userLogin = self.viewModel.currentUser()
           }
        }
        
    }

    
}
