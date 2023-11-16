
//
//  BaseViewController.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 30/10/23.
//


import Foundation
import UIKit
/// bhikhu base view main
class BaseViewMain: UIView {

    @IBInspectable public var borderwithradius: Bool = false
    @IBInspectable public var fullCorners: Bool = false
    @IBInspectable public var topCorners: Bool = false
    @IBInspectable public var leftCorners: Bool = false
    @IBInspectable public var rightCorners: Bool = false
    @IBInspectable public var isShadow: Bool = false
    @IBInspectable public var isBootom: Bool = false
    @IBInspectable public var shadowRadius: CGFloat = 7
    @IBInspectable public var shadowopacity: Float = 0.3
    @IBInspectable public var isBorderView: Bool = false
    @IBInspectable public var redius: CGFloat = 16
    @IBInspectable public var borderwidth: CGFloat = 1
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if fullCorners {
            layer.cornerRadius = redius
        }
        if leftCorners {
            roundCorners([.topLeft, .bottomLeft], radius: redius)
        }
        if rightCorners {
            roundCorners([.topRight, .bottomRight], radius: redius)
        }
        
        if isBootom {
            roundCorners([.bottomLeft, .bottomRight], radius: redius)
        }
        if isShadow { // check if ther is top and bottom both side shadow
            self.addShadow(radius: shadowRadius, opacity: shadowopacity)
        }
        if isBorderView { // check if is border then need to set grya color
            self.layer.borderColor = borderColor?.cgColor
            self.layer.borderWidth = borderwidth
        }
        if borderwithradius { // check if is border then need to set grya color
            layer.cornerRadius = redius
            self.layer.borderWidth = borderwidth
            self.layer.borderColor = borderColor?.cgColor
            
        }
    }

}
