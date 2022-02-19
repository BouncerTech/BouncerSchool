//
//  MapViewController.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/15/22.
//

import Foundation
import MapKit
import UIKit

class MapViewController: UIViewController{
    
    var mapView: MapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView = MapView(mapVC: self)
        
        view.backgroundColor = .green
    }
}
