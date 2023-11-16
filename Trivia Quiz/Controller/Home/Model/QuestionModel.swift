//
//  QuestionModel.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import Foundation

// MARK: - Question
struct QuestionModel: Codable {
    let responseCode: Int
    let results: [ResultModel]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

// MARK: - Result
struct ResultModel: Codable {
    let category: String
    let type: TypeEnumModel
    let difficulty: DifficultyModel
    let question, correctAnswer: String
    var  incorrectAnswers: [String]?
    var  givenAnswer = ""
    var  isAnswered = false
    var  selectedOption = 0
    var  correctAnswerIndex = 0

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum DifficultyModel: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnumModel: String, Codable {
    case boolean = "boolean"
    case multiple = "multiple"
}
