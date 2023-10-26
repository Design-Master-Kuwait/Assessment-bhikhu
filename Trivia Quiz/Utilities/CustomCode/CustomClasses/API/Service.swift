//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//


import Foundation
import Moya
import Alamofire
import SwiftyJSON
import UIKit

// 1:
// MARK: - API Services
enum Service {

    // -- User Login
    // Login user to the application.
    case login(param: [String: Any])
    
    // Get celebrity
    case getQuestion
    
}

// 2:
extension Service: TargetType {

    /// The type of HTTP task to be performed.
    var task: Task {

        switch self {
        case   .getQuestion:
            return .requestPlain
            
        case .login(let param):
        return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        
        }
    }

    /// The target's base `URL`.
    var baseURL: URL {
        switch self {
        default:
            if let url = URL(string: API.URL.BASE_URL) {
                return url
            }
        }
        fatalError("UNABLE TO CREATE URL FOR API CALL")
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {

        switch self {

        // User Login Registration
        case .login:
            return "email_login"
            
        case .getQuestion:
            return "celebrity"
       
        }
    }

    /// The HTTP method used in the request.
    var method: Moya.Method {

        switch self {
        case  .getQuestion:
            return .get
            
        default:
            return .post
        }
    }

    /// Provides stub data for use in testing.
    var sampleData: Data {
        return Data()
    }

    /// The headers to be used in the request.
    var headers: [String: String]? {
        return ["Content-Type": "application/json"] // + aDictMetaData
    }

    
    
}
