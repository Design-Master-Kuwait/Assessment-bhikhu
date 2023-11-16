//
//  HomeVC.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import UIKit

/// Home VC contain game started with iist and timer
class LevelSelectionVC: BaseViewController, StoryboardSceneBased {
    
    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.home.rawValue, bundle: nil) 

    // MARK: Variable
    private lazy var homeVM: HomeVM = {
        return HomeVM()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // action method on question selection click
    /// - Parameter sender: object of button
    @IBAction func btnSelectionTappped(_ sender: BaseButton) {
        switch sender.tag {
        case GameLevel.easy.rawValue:
            homeVM.saveLevelSelectionData(amount: 20, category: 10, difficulty: GameDifficultLevel.easy.rawValue, type: GameTypes.multiple.rawValue)
        default:
            break
        }
        getQuestionAPI()
    }
    /// Get Question list API
    func getQuestionAPI() {
        homeVM.callWSGetQuestion { questionModel, isSucess in
            if let arrData = questionModel?.results {
                let controller = QuestionVC.instantiate()
                controller.arrQuestion = arrData
                self.pushVC(controller: controller)
            }
            
        }
    }
}
