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



/// Game Deficlut Level
public enum GameDifficultLevel: String {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
    
}

/// Game Types true false, multiple
public enum GameTypes: String {
    case multiple = "multiple"
    case truefalse = "truefalse"
    
    
}


