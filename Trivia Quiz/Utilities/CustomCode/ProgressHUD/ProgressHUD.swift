//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//

import UIKit
import SVProgressHUD
class ProgressHUD {
    
    class func show() {
        //        self.displaySpinner()
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.show()
    }
    class func hide() {
        SVProgressHUD.dismiss()
    }
    private class func displaySpinner() {
        DispatchQueue.main.async {
            guard let keyWindow = KEY_WINDOW else {return}
            for view in (keyWindow.subviews) where view.tag == 500 {
                view.removeFromSuperview()
            }
            let blurView = UIView()
            blurView.frame = (keyWindow.bounds)
            blurView.tag = 500
            blurView.backgroundColor = UIColor.clear
            let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
            activityIndicatorView.color = UIColor.blue
            activityIndicatorView.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
            activityIndicatorView.center = blurView.center
            blurView.addSubview(activityIndicatorView)
            KEY_WINDOW?.addSubview(blurView)
            activityIndicatorView.startAnimating()
        }
    }
    
    private class func removeSpinner() {
        SVProgressHUD.dismiss()
    }
}
