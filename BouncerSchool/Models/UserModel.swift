//
//  UserModel.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/18/22.
//

import Foundation

class UserModel{
    
    let uid: String
    let imageURL: String
    let email: String
    
    init(uid: String, imageURL: String, email: String){
        self.uid = uid
        self.imageURL = imageURL
        self.email = email
    }
}
