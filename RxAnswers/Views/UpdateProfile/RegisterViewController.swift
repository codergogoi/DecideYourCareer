//
//  RegisterViewController.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/8/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift
/*
 uid,
     first_name,
     last_name,
     parents_name,
     contact_number,
     address,
     email_id,
     cls, gender } = postData;

 const token = localStorage.getItem('app_token');
 axios.defaults.baseURL = BASE_URL;
 axios.defaults.headers.common['Authorization'] = token;
 axios
     .post('/students/register', {
         uid,
         first_name,
         last_name,
         parents_name,
         contact_number,
         address,
         email_id,
         cls,
         token,
         gender
     })
 */

/*
 Question Paper
 const { user_id } = postData;

 const token = localStorage.getItem('app_token');
 axios.defaults.baseURL = BASE_URL;
 axios.defaults.headers.common['Authorization'] = token;
 axios
     .post('/questions/paper/'+user_id, { })
 */

class RegisterViewController: UIViewController {
    
    var onDidRegister:(()->())?

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtParentName: UITextField!
    @IBOutlet weak var txtContactNumber: UITextField!
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var selectGender: UISegmentedControl!
    @IBOutlet weak var txtAddress: UITextView!
    
    var viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFirstName.rx.text.orEmpty.bind(to: viewModel.firstName).disposed(by: disposeBag)
        txtLastName.rx.text.orEmpty.bind(to: viewModel.lastName).disposed(by: disposeBag)
        txtParentName.rx.text.orEmpty.bind(to: viewModel.parentName).disposed(by: disposeBag)
        txtContactNumber.rx.text.orEmpty.bind(to: viewModel.contactNumber).disposed(by: disposeBag)
        txtEmailId.rx.text.orEmpty.bind(to: viewModel.emailId).disposed(by: disposeBag)
        txtAddress.rx.text.orEmpty.bind(to: viewModel.address).disposed(by: disposeBag)
        selectGender.rx.selectedSegmentIndex.subscribe( onNext:{ index in
            self.viewModel.gender.accept("\(index)")
        }).disposed(by: disposeBag)

    }
    
    
    @IBAction func onTapNext(_ sender: Any) {
        self.viewModel.onRegister { [weak self] (status) in
            if status{
                print("Successfully Updated")
                self?.onDidRegister?()
                DispatchQueue.main.async {
                    self?.dismiss(animated: true, completion: nil)
                }
            }else{
                print("Error while updating")
            }
        }
    }

}
