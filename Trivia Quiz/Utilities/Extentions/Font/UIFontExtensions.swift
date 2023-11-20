//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//
import Foundation
import UIKit

enum fontEnum: String {
    case QuicksandBold    = "Quicksand-Bold"
    case QuicksandBoldItalic         = "Quicksand-BoldItalic"
    case QuicksandItalic        = "Quicksand-Italic"
    case QuicksandLight        = "Quicksand-Light"
    case QuicksandLightItalic        = "Quicksand-LightItalic"
    case QuicksandRegular        = "Quicksand-Regular"
    
}

extension UIFont {
    
    // HOW TO USE : UIFont.OpenSansRegular(16.0)
    
    private class func fontWithName(name: String, Size: CGFloat ) -> UIFont {
        return UIFont(name: name, size: Size)!
    }
    
    // Example font
    // Please update it
    class func quicksandBold(size: CGFloat) -> UIFont {
        
        return self.fontWithName(name: fontEnum.QuicksandBold.rawValue, Size: size)
    }
    class func quicksandBoldItalic(size: CGFloat) -> UIFont {
        return self.fontWithName(name: fontEnum.QuicksandBoldItalic.rawValue, Size: size)
    }
    
    class func quicksandItalic(size: CGFloat) -> UIFont {
        return self.fontWithName(name: fontEnum.QuicksandItalic.rawValue, Size: size)
    }
    class func quicksandLight(size: CGFloat) -> UIFont {
        return self.fontWithName(name: fontEnum.QuicksandLight.rawValue, Size: size)
    }
    class func quicksandLightItalic(size: CGFloat) -> UIFont {
        return self.fontWithName(name: fontEnum.QuicksandLightItalic.rawValue, Size: size)
    }
    class func quicksandRegular(size: CGFloat) -> UIFont {
        return self.fontWithName(name: fontEnum.QuicksandRegular.rawValue, Size: size)
    }
    
    class func customFont(name: FontName , size: CGFloat) -> UIFont? {
        return UIFont(name: name.rawValue, size: size)
    }
}

enum FontName: String {
    
    case bold        = "Quicksand-Bold"
    case boldItalic  = "Quicksand-BoldItalic"
    case italic      = "Quicksand-Italic"
    case light       = "Quicksand-Light"
    case lightItalic = "Quicksand-LightItalic"
    case regular     = "Quicksand-Regular"
    
}

/// Enum for App Font sizes
enum FontSize: CGFloat {
    
    case large = 20
    
    case mediaum = 14
    
    case regular = 16
    
    case largeItalic = 25
    
    case boldarge = 24
    
    case largeButtonTitle = 35
    
    case lableLarge = 50
    
    
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
