//
//  UiButtonExtension.swift
//  Trivia Quiz
//
//  Created by Hetu on 30/10/23.
//

import Foundation
import UIKit

// MARK: - Add Right Image
extension UIButton {
    
    /// Add icon in left button with trime
    /// - Parameter image: UI Image
    func addLeftIcon(image: String?) {
        guard let anImage = image?.trimmed else { return }
        addLeftIcon(image: UIImage(named: anImage))
    }

    func addLeftIcon(image: UIImage?) {

        guard let anImage = image else { return }

        let imageView = UIImageView(image: anImage)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        let length = CGFloat(16)
        titleEdgeInsets.left += length
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: self.titleLabel!.leadingAnchor, constant: -10),
            imageView.centerYAnchor.constraint(equalTo: self.titleLabel!.centerYAnchor, constant: 0)
        ])

    }

}
