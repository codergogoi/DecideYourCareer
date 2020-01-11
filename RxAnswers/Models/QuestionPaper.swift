//
//  QuestionPaper.swift
//  RxAnswers
//
//  Created by JAYANTA GOGOI on 1/9/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import Foundation

struct QuestionResponse: Decodable {
    var data: QuestionData
    var status: Int
    
    private enum  CodingKeys: String, CodingKey{
        case data = "data"
        case status = "status"
    }
    
}


struct QuestionData: Decodable {
    var paper: [Question]
    var time: String
    var paperId: String
    
    private enum CodingKeys: String, CodingKey{
        case paper = "paper"
        case time = "time"
        case paperId = "paper_id"
    }
}

struct Question: Decodable {
    var sl: Int?
    var id: String?
    var qid: String?
    var question: String?
    var headline: String?
    var questionType: String?
    var option1: String?
    var option2: String?
    var option3: String?
    var option4: String?
    var weight1: String?
    var weight2: String?
    var weight3:  String?
    var weight4: String?
    var chapter: String?
    var isAptitude: Bool?
    var imgUrl: String?
    
    private enum CodingKeys: String, CodingKey{
        case sl = "sl"
        case id = "id"
        case qid = "qid"
        case question = "question"
        case headline = "headline"
        case questionType = "q_type"
        case option1 = "option_1"
        case option2 = "option_2"
        case option3 = "option_3"
        case option4 = "option_4"
        case weight1 = "w_1"
        case weight2 = "w_2"
        case weight3 = "w_3"
        case weight4 = "w_4"
        case chapter = "chapter"
        case isAptitude = "is_aptitude"
        case imgUrl = "img"
    }
    
}
