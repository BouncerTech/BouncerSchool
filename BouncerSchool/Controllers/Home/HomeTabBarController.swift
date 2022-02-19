//
//  HomeViewController.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/15/22.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController{
    
    var profileButton: ProfileButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .greyColor()
        self.tabBar.unselectedItemTintColor = .lightGray
        
        self.profileButton = ProfileButton(home: self)
        
        
        
        ///MAP
        let mapVC = MapViewController()
        let mapIcon = UITabBarItem(title: "Map",
                                   image: UIImage(systemName: "mappin.and.ellipse"),
                                   selectedImage: UIImage(systemName: "mappin.and.ellipse"))
        mapVC.tabBarItem = mapIcon
        
        ///MESSAGE
        let messageVC = MessengerViewController()
        let messageIcon = UITabBarItem(title: "Chat",
                                       image: UIImage(systemName: "bubble.right"),
                                       selectedImage: UIImage(systemName: "bubble.right"))
        messageVC.tabBarItem = messageIcon
        
        ///CAMERA
        let cameraVC = CameraViewController()
        let cameraIcon = UITabBarItem(title: "Camera",
                                      image: UIImage(systemName: "camera.metering.partial"),
                                      selectedImage: UIImage(systemName: "camera.metering.partial"))
        cameraVC.tabBarItem = cameraIcon
        
        ///STORY
        let storyVC = StoryViewController()
        let storyIcon = UITabBarItem(title: "Story",
                                     image: UIImage(systemName: "person.2"),
                                     selectedImage: UIImage(systemName: "person.2"))
        storyVC.tabBarItem = storyIcon
        
       
        self.viewControllers = [mapVC, messageVC, cameraVC, storyVC]
        
    }
    
   
}


