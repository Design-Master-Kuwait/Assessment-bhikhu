//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import Foundation
import UIKit

extension String {
    /// This will get the Localization String from the string file based on the current language
    ///
    ///        "Your String".localized -> "Localized string from the file" // second week in the current year.
    ///
    var localized: String {
        let strLang: String? = UDManager.languageCode ?? "en"

        // Get the Path for the String file based on language selction
        guard let path = MAIN_BUNDLE.path(forResource: strLang, ofType: "lproj") else {
            return self
        }

        // Get the Bundle Path
        let langBundle = Bundle(path: path)

        // Get the Local String for Key and return it
        return langBundle?.localizedString(forKey: self, value: "", table: nil) ?? self
    }
    
    /// String with no spaces or new lines in beginning and end.
    ///
    ///     "This is your String!\n ".isBlank      // Returns This is your String!
    ///
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// Remove spacial charterot  from string
    var removeSpecialCharsFromString: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
        return self.filter {okayChars.contains($0) }
    }

}
