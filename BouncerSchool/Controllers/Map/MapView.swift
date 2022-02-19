//
//  MapView.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/16/22.
//

import Foundation
import MapKit
import CoreLocation

class MapView: MKMapView, MKMapViewDelegate{
    
    var manager = CLLocationManager()
    
    init(mapVC: MapViewController){
        super.init(frame: mapVC.view.frame)
        mapVC.view.addSubview(self)
        manager.delegate = self
       
        self.showsUserLocation = true
        //self.bounds = mapVC.view.bounds

        let location = self.userLocation
        
        self.setCenter(location.coordinate, animated: true)
    }
    

    
    override func view(for annotation: MKAnnotation) -> MKAnnotationView? {
        return nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension MapView: CLLocationManagerDelegate{
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }else if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways{
            return
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("LOLOLOLOLOL")
//
//        if let location = manager.location?.coordinate{
//            self.setCenter(location, animated: true)
//        }
//    }
}
