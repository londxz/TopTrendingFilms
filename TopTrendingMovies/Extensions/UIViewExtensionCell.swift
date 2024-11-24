//
//  UIViewExtentionCell.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 22.11.2024.
//

import UIKit

extension UIView {
    
    func round(_ radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
