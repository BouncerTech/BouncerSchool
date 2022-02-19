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
    
    init(messageVC: MessengerViewController){
        super.init(frame: .zero, collectionViewLayout: layout)
        messageVC.view.addSubview(self)
        
        self.setDimensions(height: .makeHeight(896) - .makeHeight(70), width: .makeWidth(414))
        self.centerX(inView: messageVC.view, topAnchor: messageVC.view.topAnchor, paddingTop: .makeHeight(70))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessagesCollectionView: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
}
