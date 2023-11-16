
//
//  BaseViewController.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 30/10/23.
//

import Foundation
import UIKit

class BaseButton: UIButton {

    @IBInspectable var enableClick: Bool = true {
        didSet {
            setupUI()
        }
    }
    /// Set the name of the image which will be used as a Right Image.
    @IBInspectable var leftImage: String? {
        didSet {
            addLeftIcon(image: leftImage)
        }
    }
    // Change Style with Background Border, set by default clear
    @IBInspectable var buttonBackgroundColor: UIColor =  UIColor.white {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var buttonTextolor: UIColor =  UIColor.white {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var borderColors: UIColor =  UIColor.white {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable var isSmall: Bool = false {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var isBold: Bool = false {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var isLargeItalic: Bool = false {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var isLargeBold: Bool = false {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable var isBorder: Bool = false {
        didSet {
            setupUI()
        }
    }

    
    @IBInspectable var cornerRounded: CGFloat = 8 {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var borderRound: CGFloat = 8 {
        didSet {
            setupUI()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        
        titleLabel?.font =  UIFont.quicksandRegular(size: FontSize.mediaum.rawValue)
        if isBold {
            titleLabel?.font = UIFont.quicksandBold(size: FontSize.boldarge.rawValue)
        }
        if isLargeBold {
            titleLabel?.font = UIFont.quicksandBold(size: FontSize.largeButtonTitle.rawValue)
        }
        
        
        layer.cornerRadius = cornerRounded
        backgroundColor = buttonBackgroundColor
        self.isEnabled =  enableClick

        self.titleLabel?.textColor = buttonTextolor
        setTitleColor(buttonTextolor, for: .normal)
        if isBorder {
            layer.borderWidth = 1
            layer.borderColor = borderColors.cgColor
            
        }
        if let aStrTitle = title(for: .normal)?.localized {
            if title(for: .normal)! != aStrTitle {
                setTitle(aStrTitle, for: .normal)
                titleLabel?.adjustsFontSizeToFitWidth = true
            } else {
                titleLabel?.text =  titleLabel?.text?.localized
                return
            }
        }
    }
}

class BaseNormalButton: UIButton {

    @IBInspectable var isBold: Bool = false {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var isSemibold: Bool = false {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable var isSemiboldLarge: Bool = false {
        didSet {
            setupUI()
        }
    }
    @IBInspectable var regularTitle: Bool = false {
        didSet {
            setupUI()
        }
    }
   
    @IBInspectable var cornerRounded: CGFloat = 8 {
        didSet {
            setupUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        titleLabel?.font =  UIFont.quicksandRegular(size: FontSize.mediaum.rawValue)
        if isBold {
            titleLabel?.font = UIFont.quicksandBold(size: FontSize.mediaum.rawValue)
        }
        
        layer.cornerRadius = cornerRounded
        if let aStrTitle = title(for: .normal)?.localized {
            if title(for: .normal)! != aStrTitle {
                setTitle(aStrTitle, for: .normal)
                titleLabel?.adjustsFontSizeToFitWidth = true
            } else {
                return
            }

        }
    }
}
class BaseSmallButton: UIButton {
    
    @IBInspectable var cornerRounded: CGFloat = 8 {
        didSet {
            setupUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        titleLabel?.font =  UIFont.quicksandRegular(size: FontSize.mediaum.rawValue)
        layer.cornerRadius = cornerRounded
        self.imageView?.contentMode = .center
        if let aStrTitle = title(for: .normal)?.localized {
            if title(for: .normal)! != aStrTitle {
                setTitle(aStrTitle, for: .normal)
                titleLabel?.adjustsFontSizeToFitWidth = true
            } else {
                return
            }

        }
    }
}


