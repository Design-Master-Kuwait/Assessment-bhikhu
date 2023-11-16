//
//  UiCollectionViewExtention.swift
//  Trivia Quiz
//
//  Created by Hetu on 01/11/23.
//

import Foundation
import UIKit

extension UICollectionView {
    
    /// set question layout coolection UI
    func questionLayoutUI() {
        let fllowLayout = UICollectionViewFlowLayout()
        fllowLayout.itemSize = CGSize(width: self.width, height: self.height)
        fllowLayout.scrollDirection = .horizontal
        fllowLayout.minimumLineSpacing = 0
        fllowLayout.minimumInteritemSpacing = 0
        self.isPagingEnabled = true
        self.collectionViewLayout =  fllowLayout

    }
}
