//
//  Enum.swift
//  Trivia Quiz
//
//  Created by Hetu on 30/10/23.
//

import Foundation
import UIKit

/// Game Level Selection
enum GameLevel : Int {
    case easy = 1
    case medium = 2
    case hard = 3
    
    func title () -> String {
        switch self {
        case .easy:
          return "easy"
        case .medium:
          return "medium"
        case .hard:
          return "hard"
        }
      }

}

/// Publis image  which is added in assset  file
public enum AppImage: String {
    case background = "ic_appbg"
}

/// Optiosns of question
public enum QuestionsOptions: Int {
    case first = 0
    case second = 1
    case third = 2
    case fourth = 3
}

/// Game Types true false, multiple
public enum GameTypes: String {
    case multiple = "multiple"
    case truefalse = "truefalse"
    
    
}


