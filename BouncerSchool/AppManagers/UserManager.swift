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
    
    
    public func fetchUsers(completion: @escaping(_ users: [UserModel]?, _ e: Error?) -> Void){
        REF_USERS.getDocuments { snap, e in
            if let e = e{
                return completion(nil, e)
            }
            
            var userObj = [UserModel]()
            var nilCount = 0
            
            if let snap = snap{
                if !snap.isEmpty{
                    snap.documents.forEach { doc in
                        let data = doc.data()
                        
                        let imageUrl = data[DatabaseUser.imageURL] as? String
                        let uid = data[DatabaseUser.uid] as? String
                        let email = data[DatabaseUser.email] as? String
                        
                        
                        if let imageUrl = imageUrl, let uid = uid, let email = email{
                            userObj.append(UserModel(uid: uid, imageURL: imageUrl, email: email))
                        }else{
                            nilCount += 1
                        }
                        
                        
                        if userObj.count + nilCount == snap.documents.count{
                            return completion(userObj, nil)
                        }
                    }
                }else{
                    return completion(nil, nil)
                }
            }else{
                return completion(nil, nil)
            }
        }
    }
    
    
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
