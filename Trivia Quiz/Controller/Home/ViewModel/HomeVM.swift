//
//  HomeVM.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import Foundation
import UIKit

class HomeVM {

    private var amount: Int!
    private var category: Int = 0
    private var difficulty: String!
    private var type: String!
        
    /// Save Level Selection Data
    /// - Parameters:
    ///   - amount: Int count of questions
    ///   - category: Int level category whic we will get from api of catefory selection
    ///   - difficulty: string  diffilcult lebel which is easy , mediaum , hard
    ///   - type: string  type like multiple and true  false
    public func saveLevelSelectionData(amount: Int, category: Int,difficulty: String,type: String ) {
        self.amount = amount
        self.category = category
        self.difficulty = difficulty
        self.type = type
    }
    
    // webservice call for get Quiz Qustions
    public func callWSGetQuestion(completion: @escaping ((QuestionModel?, Bool) -> Void)) {
        var param: [String: Any] = [:]
        param[API.Key.amount]  = self.amount
        param[API.Key.category]  = self.category
        param[API.Key.difficulty]  = self.difficulty
        param[API.Key.type]  = self.type
        
        let service = Service.getQuestion(param: param)
        Network.request(target: service, isSilent: false, resultType: QuestionModel.self) { (result) in
            switch result {
            case .success(let response, let success):
                if success {
                    guard let questionModel = response as? QuestionModel else { return }
                    completion(questionModel, true)
                } else {
                    guard let errorModel = response as? ErrorModel else { return }
                    AlertMesage.show(.error, message: errorModel.error?.message ?? Localizable.ErrorMsg.kMSGStatus0)
                    completion(nil, false)
                }
            case .failure(let error, _):
                AlertMesage.show(.error, message: error.localizedDescription)
                completion(nil, false)
            }
        }
    }
}


