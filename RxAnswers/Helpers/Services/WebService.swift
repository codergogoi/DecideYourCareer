//
//  WebService.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/6/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa


struct WebService{
    
    func request<T: Decodable>(endPoint: String, isPost: Bool =  false, postData: [String: Any] = [:]) -> Observable<T>{
        
        return Observable.create { observer in
            
            let url = URL(string: "\(BaseURL)\(endPoint)")!
            
            var request = URLRequest(url: url)
            
            if let token = UserDefaults.standard.value(forKey: "token") as?  String{
                request.addValue(token, forHTTPHeaderField: "Authorization") //rename this field as per server requirement
            }
            
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            if isPost{ // post data from dictionary
               let postData = try? JSONSerialization.data(withJSONObject: postData, options: [])
               request.httpBody = postData
               request.httpMethod = "POST"
            }
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    observer.onError(error!)
                    return
                }
                
                print(String.init(data: data, encoding: String.Encoding.utf8) ?? "")
                
                do{
                    let responseData = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(responseData)
                }catch let jsonError{
                    print(jsonError.localizedDescription)
                    observer.onError(jsonError)
                }
                
            }.resume()
            
            return Disposables.create()
        }
        
        
    }
    
    
}


