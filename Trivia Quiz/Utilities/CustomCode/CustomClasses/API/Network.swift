//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//


import Foundation
import UIKit
import Moya
import Alamofire
import SwiftyJSON

// Glabal Data Cashing objkect
// let cache = Shared.dataCache

#if DEBUG
// debug only code
let provider = MoyaProvider<Service>(session: APIManager.shared,
                                     plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

#else

// release only code
let provider = MoyaProvider<Service>(session: APIManager.shared)

#endif

class APIManager: Alamofire.Session {
    
    static let shared: APIManager = {
        
        let configuration = URLSessionConfiguration.default
        //        configuration.waitsForConnectivity = true
        
        // The max time interval to wait between server responses before cancelling the request. All session tasks use this value, but it is really designed for tasks running on a default or ephemeral session. Tasks running on a background session will automatically be retried.
        // The default value is 4 minutes.SwiftMessages
        configuration.timeoutIntervalForRequest = 60 * 5 // as seconds, you can set your request timeout. default 5 minutes //
        
        // This property determines the resource timeout interval for all tasks within sessions based on this configuration. The resource timeout interval controls how long (in seconds) to wait for an entire resource to transfer before giving up. The resource timer starts when the request is initiated and counts until either the request completes or this timeout interval is reached, whichever comes first.
        // The default value is 7 days.
        configuration.timeoutIntervalForResource = 604800 // 60*60*24*7 = 604800(seconds)
        
        //        configuration.requestCachePolicy = .useProtocolCachePolicy
        
        let manager = APIManager(configuration: configuration)
        return manager // APIManager(configuration: configuration)
        
    }()
    
}

// MARK: - NETWORK Wraper class

class Network {
    
    /// Closure to be executed when a request has completed.
    ///   - completion: typealias for Results
    public typealias Completion<T: Codable> = (Results<Any?, Bool>) -> Void
    // ----------
    
    @discardableResult
    class func request<T: Codable>(target: Service, isSilent: Bool = false, resultType: T.Type, completion: @escaping Completion<T?>) -> Cancellable {
        
        if !isSilent {
            ProgressHUD.show()
        }
        return provider.request(target) { (result) in
            if !isSilent {
                ProgressHUD.hide()
            }
            switch result {
            case let .success(response):
                Logger.log(response.statusCode)
                switch response.statusCode {
                case 200...300 : // greater or equal than 200 and less or equal than 300
                    do {
                        let data = try JSONDecoder().decode(T.self, from: response.data)
                        Logger.log(data)
                        completion(.success(data, true))
                    } catch let error {
                        print("NOT ABLE TO PARSE DATA")
                        AlertMesage.show(.error, message: error.localizedDescription)
                        
                    }
                    
                case 400:
                    do {
                        let data = try JSONDecoder().decode(ErrorModel.self, from: response.data)
                        Logger.log(data)
                        completion(.success(data, false))
                        AlertMesage.show(.error, message: data.error?.message ?? Localizable.ErrorMsg.kMSGStatus0)
                    } catch {
                        print("NOT ABLE TO PARSE DATA")
                        AlertMesage.show(.error, message:  Localizable.ErrorMsg.kMSGStatus0)
                    }
                    
                case 401:
                    do {
                        let data = try JSONDecoder().decode(ErrorModel.self, from: response.data)
                        Logger.log(data)
                        // invalid access token or unauthorized logout than show login screen
                    } catch {
                        print("NOT ABLE TO PARSE DATA")
                        AlertMesage.show(.error, message:  Localizable.ErrorMsg.kMSGStatus0)
                    }
                    
                default:
                    
                    do {
                        let data = try JSONDecoder().decode(ErrorModel.self, from: response.data)
                        Logger.log(data)
                        completion(.success(data, false))
                    } catch {
                        print("NOT ABLE TO PARSE DATA")
                        AlertMesage.show(.error, message:  Localizable.ErrorMsg.kMSGStatus0)
                    }
                }
                
            case .failure(let error):
                Logger.log("Error in API: ", error)
                completion(.failure(error, false))
                
                AlertMesage.show(.error, message:  error.localizedDescription)
                // failureCallBack(error)
            }
        }
    }
}

enum Results<Value, Bool> {
    case success(Value, Bool)
    case failure(Error, Bool)
}



