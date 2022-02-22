//
//  MessagesCollectionView.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/17/22.
//

import Foundation
import UIKit


class MessagesCollectionView: UICollectionView{
    
    let layout = UICollectionViewFlowLayout()
    var users: [UserModel]!
    
    init(messageVC: MessengerViewController, users: [UserModel]){
        super.init(frame: .zero, collectionViewLayout: layout)
        messageVC.view.addSubview(self)
        self.users = users
        
        self.setDimensions(height: .makeHeight(896) - .makeHeight(70), width: .makeWidth(414))
        self.centerX(inView: messageVC.view, topAnchor: messageVC.view.topAnchor, paddingTop: .makeHeight(70))
        
        self.dataSource = self
        self.delegate = self
        self.reloadData()
        
        self.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.id)
        self.backgroundColor = .greyColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Data Source
extension MessagesCollectionView: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.id, for: indexPath) as! MessageCell
        
        cell.userModel = users[indexPath.row]
        
        return cell
    }
}

//MARK: Sizing
extension MessagesCollectionView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .makeWidth(414), height: 90)
    }
}
