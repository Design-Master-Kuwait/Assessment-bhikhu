//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import Foundation
import UIKit
import Reachability


/// General object of Application Delegate
let APP_DELEGATE: AppDelegate                   =   UIApplication.shared.delegate as! AppDelegate

/// get the first root viewcontroller
var ROOT_FIRST_VC                               = UIApplication.shared.windows.first

/// General object of Main Bundle
let MAIN_BUNDLE                                 =   Bundle.main

/// General object of Main Screen
let MAIN_SCREEN                                 =   UIScreen.main

/// General object of UIApplication
let APPLICATION                                 =   UIApplication.shared

/// General object of Current Device
let CURRENT_DEVICE                              =   UIDevice.current

/// General object of NotificationCenter
let NOTIFICATION_CENTER                         =   NotificationCenter.default

/// get the keywindow
let KEY_WINDOW                                  =  UIApplication.shared.windows.filter {$0.isKeyWindow}.first

/// General object of UserDefaults
let USER_DEFAULTS                               =   UserDefaults.standard

/// General object for the Reachability
let reachability                                = try! Reachability()


class Constant {
    // --------------------------------------------------------------------------
    // MARK: Default Values
    // --------------------------------------------------------------------------
    static let DEVICE_SCREEN_WIDTH =  MAIN_SCREEN.bounds.width
    static let DEVICE_SCREEN_HEIGHT =  MAIN_SCREEN.bounds.height
  
}

