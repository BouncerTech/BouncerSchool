////
////  MyCollectionView.swift
////  SwiftCollectionViews
////
////  Created by Andrew Kestler on 2/10/22.
////
//
//import Foundation
//import UIKit
//
//class MyCollectionView: UICollectionView{
//
//    init(vc: SecondViewController){
//        super.init(frame: .zero, collectionViewLayout: vc.layout)
//
//        dataSource = vc
//        delegate = vc
//        register(Cell.self, forCellWithReuseIdentifier: Cell.id)
//        alwaysBounceHorizontal = true
//
//        vc.view.addSubview(self)
//        setDimensions(height: .makeHeight(800), width: .makeWidth(414))
//        centerX(inView: vc.view, topAnchor: vc.view.topAnchor, paddingTop: .makeHeight(96))
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
