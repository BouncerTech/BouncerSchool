//
//  MessengerViewController.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/15/22.
//

import Foundation
import UIKit

class MessengerViewController: UIViewController{
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        MessengerManager.shared.sendChat(receiverUid: "8Edhbd8mbeNOyI0MxQaMAtAfv6A3", content: "HOWDY") { e in
            if let e = e{
                print(e.localizedDescription)
            }
        }
    }
}
