//
//  BaseViewController.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import UIKit

// Base viewcontroller class , will use for alll viewcontroller as base controller
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: AppImage.background.rawValue) ?? UIImage())
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self is QuestionVC || self is EndGameVC {
            self.navigationItem.hidesBackButton = true
        }
        
    }
}
