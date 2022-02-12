//
//  Cell.swift
//  SwiftCollectionViews
//
//  Created by Andrew Kestler on 2/10/22.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static let id = "our-cell"
    let circleColor: UIView = UIView()
    
    var cellColor: UIColor! {
        didSet{
            setupCell()
        }
    }
    
    func setupCell(){
        contentView.addSubview(circleColor)
        circleColor.center(inView: contentView)
        circleColor.setDimensions(height: 50, width: 50)
        circleColor.backgroundColor = cellColor
    }
}
