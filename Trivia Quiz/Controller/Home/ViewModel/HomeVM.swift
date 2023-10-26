//
//  HomeVM.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import Foundation
import UIKit

class AuthVM {

    // webservice call for get Quiz Qustions
    public func callWSGetQuestion(completion: @escaping ((QuestionModel?, Bool) -> Void)) {
        var param: [String: Any] = [:]
        let service = Service.login(param: param)
        Network.request(target: service, isSilent: true, resultType: QuestionModel.self) { (result) in
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


