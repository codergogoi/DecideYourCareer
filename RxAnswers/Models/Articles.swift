//
//  Articles.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/7/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

struct Article: Decodable{
    let title: String
    let description: String
}

struct Articles: Decodable {
    let articles: [Article]
}
