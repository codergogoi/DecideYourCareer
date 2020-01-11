//
//  UserLogin.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/7/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import Foundation


/*
 {
 "status": 200,
 "message": "User Authenticated Successfully",
 "data": {
     "uid": "11",
     "is_active": true,
     "name": "Jayanta Gogoi",
     "email": "codergogoi@gmail.com",
     "parents_name": "K Gogoi",
     "phone": "08451071128",
     "class": "ix",
     "address": "BMRA128D, Balakrishna Menon Road, Kochi, Kerala",
     "updated": null,
     "credential": "eyJ0eXAiOiJBcHBsaWNhdGlvbkNvbnRyb2xsZXIiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbl90aW1lIjoxNTc4NDY2MjA3LCJ1c2VyX2VtYWlsIjoiMTIzIiwiYXBwX2tleSI6IlJFVkVSU0VFTkdJTkVFUklORyIsInVpZCI6IjExIn0.RsN6u4nYz0VHrN339jDVsDXLDoHpVPiLgu_LIvZb7Xg",
     "token": "eyJ0eXAiOiJBcHBsaWNhdGlvbkNvbnRyb2xsZXIiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbl90aW1lIjoxNTc4NDY2MjA3LCJ1c2VyX2VtYWlsIjoiMTIzIiwiYXBwX2tleSI6IlJFVkVSU0VFTkdJTkVFUklORyIsInVpZCI6IjExIn0.RsN6u4nYz0VHrN339jDVsDXLDoHpVPiLgu_LIvZb7Xg"
 }
 }
 */


struct LoginResponse: Decodable {
    var data: UserLogin
}


struct UserLogin: Decodable {

    var userId: String
    var token: String
    var name: String
    var isActive: Bool
    var emailId: String
    
    private enum CodingKeys: String, CodingKey{
        case userId = "uid"
        case token = "token"
        case name = "name"
        case isActive = "is_active"
        case emailId = "email"
    }
    
}
