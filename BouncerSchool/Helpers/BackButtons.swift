//
//  BackButton.swift
//  Bouncer
//
//  Created by Andrew Kestler on 9/19/21.
//

import Foundation
import UIKit

class BackButton: UIButton{
    
    var viewController : UIViewController!
    var xSymbol : Bool?
    
    init(viewController: UIViewController, xSymbol: Bool) {
        super.init(frame: .zero)
        self.viewController = viewController
        self.xSymbol = xSymbol
        setupBackButton()
    }
    
   
    
    func setupBackButton(){
        viewController.view.addSubview(self)
        
        let config = UIImage.SymbolConfiguration(pointSize: 23)
       
        
        if xSymbol == true{
            let backButtonImage = UIImage(systemName: "xmark", withConfiguration: config)
            setImage(backButtonImage, for: .normal)
        }else{
            let backButtonImage = UIImage(systemName: "chevron.left", withConfiguration: config)
            setImage(backButtonImage, for: .normal)
        }
        
        
        
        anchor(top: viewController.view.safeAreaLayoutGuide.topAnchor, left: viewController.view.safeAreaLayoutGuide.leftAnchor,  paddingTop: 15.5, paddingLeft: 25)
        
        addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        
    }
    
    @objc func backButtonPressed(){
        viewController.navigationController?.popViewController(animated: true)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ModalBackButton: UIButton{
    
    var viewController : UIViewController!
    var xSymbol : Bool?
    
    init(viewController: UIViewController, xSymbol: Bool) {
        super.init(frame: .zero)
        self.viewController = viewController
        self.xSymbol = xSymbol
        setupBackButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackButton(){
        viewController.view.addSubview(self)
        
        let config = UIImage.SymbolConfiguration(pointSize: 23)
       
        
        if xSymbol == true{
            let backButtonImage = UIImage(systemName: "xmark", withConfiguration: config)
            setImage(backButtonImage, for: .normal)
        }else{
            let backButtonImage = UIImage(systemName: "chevron.left", withConfiguration: config)
            setImage(backButtonImage, for: .normal)
        }
        
        
        
        anchor(top: viewController.view.safeAreaLayoutGuide.topAnchor, left: viewController.view.safeAreaLayoutGuide.leftAnchor,  paddingTop: 15.5, paddingLeft: 25)
        
        addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        
    }
    
    @objc func backButtonPressed(){
        
        viewController.dismiss(animated: true)
       
    }
    
}

