//
//  MyButton.swift
//  SwiftCollectionViews
//
//  Created by Andrew Kestler on 2/10/22.
//

import Foundation
import UIKit

class Button: UIButton{
    
    
    init(vc: UIViewController, action: Selector, bgColor: UIColor, borderColor: UIColor? = nil, cornerRadius: CGFloat?, text: String? = nil, symbol: String? = nil){
        super.init(frame: .zero)
    
        vc.view.addSubview(self)
        backgroundColor = bgColor
        
        if let symbol = symbol {
            setImage(UIImage(systemName: symbol), for: .normal)
        }
      
        if let text = text {
            setTitle(text, for: .normal)
        }
       
        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = 1
        }
       
        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
        }
       
       
        addTarget(vc, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
