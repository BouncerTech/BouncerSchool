//
//  MessengerViewController.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/15/22.
//

import Foundation
import UIKit

class MessengerViewController: UIViewController{
    
    var messagesCV: MessagesCollectionView!
    
    init(){
        super.init(nibName: nil, bundle: nil)
        UserManager.shared.fetchUsers { users, e in
            if let e = e{
                print("DEBUG: Error fetching users - \(e.localizedDescription)")
            }
            
            if let users = users {
                self.messagesCV = MessagesCollectionView(messageVC: self, users: users)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
}
