
//
//  BaseViewController.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 30/10/23.
//

import Foundation
import UIKit



class AppBaseLabel: UILabel {
    enum LabelType: Int {
        case regular16 = 1
        case regular14 = 2
        case bold16 = 3
        case bold14 = 4
        case largeRegular = 5
        case largeBold = 6
        case bold20 = 7
        
    }
    
    @IBInspectable var colorText: UIColor =  UIColor.white {
        didSet {
            initialSetup()
        }
    }
    

    // Programmatically: use the enum
    private var labelType: LabelType = .regular16

    // Left Padding Of Label
    @IBInspectable var leftInset: CGFloat = 0 {
        didSet {
            initialSetup()
        }
    }

    // Right Padding Of Label
    @IBInspectable var rightInset: CGFloat = 0 {
        didSet {
            initialSetup()
        }
    }

    // Change Style with Rounded Border, set by default yes
    @IBInspectable var isLabelRounded: Bool = false {
        didSet {
            initialSetup()
        }
    }

    // Change Style with Background Border, set by default clear
    @IBInspectable var labelBackgroundColor: UIColor = .clear {
        didSet {
            initialSetup()
        }
    }

    // IB: use the adapter
    @IBInspectable var labelFontType: Int {
        get {
            return self.labelType.rawValue
        }
        set( shapeIndex) {
            self.labelType = LabelType(rawValue: shapeIndex) ?? .regular16
            initialSetup()
        }
    }

    override var text: String? {
        didSet {
            if text != nil {
                initialSetup()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()

    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        super.drawText(in: rect.inset(by: insets))

    }

    private func initialSetup() {

        switch labelType {
        
        case .regular14:
            font = UIFont.quicksandRegular(size: FontSize.mediaum.rawValue)

        case .regular16:
            font = UIFont.quicksandRegular(size: FontSize.regular.rawValue)
        
        case .bold16:
            font = UIFont.quicksandBold(size: FontSize.regular.rawValue)

        case .bold14:
            font = UIFont.quicksandBold(size: FontSize.mediaum.rawValue)
        
        case .largeRegular:
            font = UIFont.quicksandRegular(size: FontSize.largeItalic.rawValue)
        
        case .largeBold:
            font = UIFont.quicksandBold(size: FontSize.largeItalic.rawValue)
        case .bold20:
            font = UIFont.quicksandBold(size: FontSize.large.rawValue)
        }
        
        self.textColor = colorText
        if isLabelRounded {
            layer.cornerRadius = self.height / 2
            layer.masksToBounds = true
        }
        backgroundColor = labelBackgroundColor
        // Stop infinity loop generated from didSet
        if let aStrTitle = text?.localized {
            guard aStrTitle != text! else { return }
            text = aStrTitle
        }
    }
}
