//
//  PasswordTextField.swift
//  SwiftCollectionViews
//
//  Created by Andrew Kestler on 2/11/22.
//

import Foundation
import UIKit

class TextField: UITextField{
    
    init(vc: EntryViewController, text: String, isSecure: Bool){
        super.init(frame: .zero)
        
        vc.view.addSubview(self)
        
        //Label Above the Text Field
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: .makeWidth(18))
        label.textColor = .white
        self.addSubview(label)
        label.anchor(left: self.leftAnchor)
        label.anchor(bottom: self.topAnchor)

        //Spacing on the left & right inside the text view (when typing theres 20px of spacing)
        let leftSpacer = UIView()
        leftSpacer.setWidth(.makeWidth(20))
        let rightSpacer = UIView()
        rightSpacer.setWidth(.makeWidth(20))

        //Setup
      
        self.tintColor = .blueMinty()
        self.backgroundColor = .clear
        self.textAlignment = .left
        self.textColor = .white
        self.font =  UIFont.systemFont(ofSize: .makeWidth(13))
        self.leftView = leftSpacer
        self.leftViewMode = .always
        self.rightView = rightSpacer
        self.rightViewMode = .always
        
        //Underline View
        let underlineView = UIView()
        self.addSubview(underlineView)
        underlineView.setDimensions(height: 1, width: .makeWidth(290))
        underlineView.backgroundColor = .blueMinty()
        underlineView.centerX(inView: self, topAnchor: self.bottomAnchor)

        //Settings
        self.adjustsFontSizeToFitWidth = true
        self.keyboardAppearance = .dark
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.returnKeyType = .continue
        self.isSecureTextEntry = isSecure
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
