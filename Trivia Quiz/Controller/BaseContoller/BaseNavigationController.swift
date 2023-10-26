//
//  BaseNavigationController.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import UIKit

/// BaseNavigationController use for hanle all the navation stack and top bar
class BaseNavigationController: UINavigationController {

    /// This variable for set status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    var statusBarStyle: UIStatusBarStyle = .lightContent {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
