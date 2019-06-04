//
//  InspirationCell.swift
//  PhotoApp
//
//  Created by Valerii on 01.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import Foundation
import UIKit

class InspirationCell: UICollectionViewCell {
    
    
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var coverImageView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        // 1
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        // 2
        let delta = 1 - (
            (featuredHeight - frame.height) / (featuredHeight - standardHeight)
        )
        
        // 3
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        coverImageView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    
}
