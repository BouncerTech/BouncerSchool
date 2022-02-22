//
//  Cell.swift
//  SwiftCollectionViews
//
//  Created by Andrew Kestler on 2/10/22.
//

import UIKit

class MessageCell: UICollectionViewCell{
    
    static let id = "message-cell"
    let image: UIImageView = UIImageView()
    let nameLabel: UILabel = UILabel()
    
    var userModel: UserModel! {
        didSet{
            setupCell()
        }
    }
    
    func setupCell(){
        contentView.addSubview(image)
        image.centerY(inView: contentView, leftAnchor: contentView.leftAnchor, paddingLeft: .makeWidth(25))
        image.setDimensions(height: 50, width: 50)
        image.sd_setImage(with: URL(string: userModel.imageURL)!)
        
        contentView.addSubview(nameLabel)
        nameLabel.text = userModel.email
        nameLabel.font = .systemFont(ofSize: .makeWidth(13))
        
       
    }
}
