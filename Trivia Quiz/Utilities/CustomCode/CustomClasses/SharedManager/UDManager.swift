//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//
import Foundation
import UIKit
class UDManager {
    
    /// This will store mirror user id
    class var languageCode: String? {
        get {
            return USER_DEFAULTS.string(forKey: #function)
        }
        set {
            if newValue == nil {
                USER_DEFAULTS.removeObject(forKey: #function)
            } else {
                let strEncoded = newValue
                USER_DEFAULTS.setValue(strEncoded, forKey: #function)
                USER_DEFAULTS.synchronize()
            }
        }
    }
    
    /// This will store the value in UD that if user is logged in or not.
    class var isUserLogin: Bool {
        get {
            return USER_DEFAULTS.bool(forKey: #function)
        }
        set {
            USER_DEFAULTS.set(newValue, forKey: #function)
            USER_DEFAULTS.synchronize()
        }
    }
   
    class var loggedUserID: String {
           get {
               return UserDefaults.standard[#function] ?? ""
           }
           set {
               UserDefaults.standard[#function] = newValue
           }
       }
    class var defaultLanguage: String {
        get {
            return UserDefaults.standard[#function] ?? ""
        }
        set {
            UserDefaults.standard[#function] = newValue
        }
    }


}
extension UserDefaults {

    subscript<T>(key: String) -> T? {
        get {
            return value(forKey: key) as? T
        }
        set {
            set(newValue, forKey: key)
        }
    }

    subscript<T: RawRepresentable>(key: String) -> T? {
        get {
            if let rawValue = value(forKey: key) as? T.RawValue {
                return T(rawValue: rawValue)
            }
            return nil
        }
        set {
            set(newValue?.rawValue, forKey: key)
        }
    }
}
