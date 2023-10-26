//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//
import Foundation
import UIKit

enum fontEnum: String {
    case AdobeCleanUXRegular    = "AdobeClean-Regular"
    case AdobeCleanBold         = "AdobeClean-Bold"
    case AdobeCleanLight        = "AdobeClean-Light"
}

extension UIFont {

    // HOW TO USE : UIFont.OpenSansRegular(16.0)

    private class func fontWithName(name: String, Size: CGFloat ) -> UIFont {
        return UIFont(name: name, size: Size)!
    }

    // Example font
    // Please update it
    class func adobeCleanUXRegular(size: CGFloat) -> UIFont {
 
        return self.fontWithName(name: fontEnum.AdobeCleanUXRegular.rawValue, Size: size)
    }
    class func adobeCleanBold(size: CGFloat) -> UIFont {
        return self.fontWithName(name: fontEnum.AdobeCleanBold.rawValue, Size: size)
    }
    
    class func adobeCleanLight(size: CGFloat) -> UIFont {
        return self.fontWithName(name: fontEnum.AdobeCleanLight.rawValue, Size: size)
    }

    class func customFont(name: FontName , size: CGFloat) -> UIFont? {
        return UIFont(name: name.rawValue, size: size)
    }
}

enum FontName: String {
    
    case bold       = "NotoSansArabic-Bold"
    case extraBold  = "NotoSansArabic-ExtraBold"
    case extraLight = "NotoSansArabic-ExtraLight"
    case light      = "NotoSansArabic-Light"
    case medium     = "NotoSansArabic-Medium"
    case regular    = "NotoSansArabic-Regular"
    case semiBold   = "NotoSansArabic-SemiBold"
    case thin       = "NotoSansArabic-Thin"
}

/// Enum for App Font sizes
enum FontSize: CGFloat {
    
    case large = 26
    
    case mediaum = 16
    
    case regular = 14
    
    case  navigation = 20
    
    case  largeButton = 18
    
    case  extraSmall = 12
   
    case  extraLarge = 75
    
    case  light17 = 17
 
    case  light15 = 15
    
    case  regular24 = 24
    
    case  regular10 = 10
    
    case extraBold =  28
    
    case extralarge =  30
    
    case largeSize =  150
}

extension UIFont {

    var bold: UIFont {
        return with(.traitBold)
    }

    var italic: UIFont {
        return with(.traitItalic)
    }

    var boldItalic: UIFont {
        return with([.traitBold, .traitItalic])
    }

    /// This will return the scalled font as per the native iOS setting. Please note that this will work with your custom font as well. :)
    ///
    ///     UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.heavy).scaled
    var scaled: UIFont {
        return UIFontMetrics.default.scaledFont(for: self)
    }

    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

}
