//
//  SecondViewController.swift
//  SwiftCollectionViews
//
//  Created by Andrew Kestler on 2/10/22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate{
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var myCollectionView: MyCollectionView!
    
    var backButton: BackButton!
    
    let dataSource: [UIColor] = [.green, .purple, .orange, .blueMinty(), .black]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        backButton = BackButton(viewController: self, xSymbol: false)
        myCollectionView = MyCollectionView(vc: self)
    }
}

//MARK: Data Source
extension SecondViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.id, for: indexPath) as! Cell
        
        cell.cellColor = dataSource[indexPath.row]
        
        return cell
    }
}

//MARK: Sizing
extension SecondViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

