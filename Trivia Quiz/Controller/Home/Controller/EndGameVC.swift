//
//  EndGameVC.swift
//  Trivia Quiz
//
//  Created by Hetu on 18/11/23.
//

import UIKit

/// End Game VC for  display score of after end the  game
class EndGameVC: BaseViewController, StoryboardSceneBased{
    
    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.home.rawValue, bundle: nil)

    // MARK: - IB Outlets
    @IBOutlet weak var lblScore: AppBaseLabel!
    var intSvore: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
    }
    // MARK: - Private Methods
    private func configureOnViewDidLoad() {
        lblScore.text = String(intSvore ?? 0)
    }
    // action method on Rest button click
    /// - Parameter sender: object of button
    @IBAction func btnResetTapped(_ sender: Any){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
