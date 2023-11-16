//
//  UIViewControllerExtenstion.swift
//  Trivia Quiz
//
//  Created by Hetu on 01/11/23.
//

import Foundation
import UIKit

extension UIViewController {
    /// push controller
    /// - Parameter controller: UIViewController
    func pushVC(controller: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(controller, animated: animated)

    }
    
    /// Dispatch Queue delay with compltion handler
    /// - Parameters:
    ///   - delay: delay time
    ///   - closure: compltion call back
    func delay(_ delay: Double, closure:@escaping () -> Void) {
        
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
        
        
    }
    
}
