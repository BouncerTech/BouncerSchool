//
//  ProfileButton.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/16/22.
//

import Foundation
import UIKit
import SDWebImage

class ProfileButton: UIButton{
    
    let ourImage = UIImageView()
    
    init(home: HomeTabBarController){
        super.init(frame: .zero)
        
        home.view.addSubview(self)
        
        self.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        setDimensions(height: .makeWidth(50), width: .makeWidth(50))
        anchor(top: home.view.topAnchor, paddingTop: .makeHeight(45))
        anchor(left: home.view.leftAnchor, paddingLeft: .makeWidth(10))
        layer.cornerRadius = .makeWidth(50) * 0.5
        layer.masksToBounds = true
        
        loadProfileImage()
    }
    
    func loadProfileImage(){
        let stringUrl = "https://firebasestorage.googleapis.com:443/v0/b/bounceracademy-be2ba.appspot.com/o/ProfileImages%2Fd5d5HnnT01aY1YV2LJtpMsyKzbk1?alt=media&token=121ca906-7738-423d-8fe7-29a6e75b6ffd"
        
        ourImage.sd_setImage(with: URL(string: stringUrl)!) { i, e, c, u in
            if let e = e{
                print("DEBUG: Error loading image - \(e.localizedDescription)")
            }
            
            if let i = i{
                self.setImage(i, for: .normal)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
