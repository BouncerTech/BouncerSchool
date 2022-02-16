//
//  UserManager.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/12/22.
//

import Foundation
import Firebase
import FirebaseStorage

let REF_STORAGE = Storage.storage()
class UserManager{
    
    private init(){}
    
    static let shared = UserManager()
    
    public func uploadUserImage(image: UIImage, uid: String, completion: @escaping(FirestoreCompletion)){
      let storageLocation = REF_STORAGE.reference(withPath: "ProfileImages/\(uid)")
        
        if let uploadData = image.jpegData(compressionQuality: 0.15) {
            storageLocation.putData(uploadData, metadata: nil) { (metaData, e) in
                if let e = e{
                    return completion(e)
                }
                
                storageLocation.downloadURL(completion: { returnedURL, e in
                    if let e = e{
                        return completion(e)
                    }
                    
                    if let returnedURL = returnedURL {
                        REF_USERS.document(uid).updateData([DatabaseUser.imageURL: returnedURL.absoluteString], completion: completion)
                    }
                })
            }
        }
    }
}
