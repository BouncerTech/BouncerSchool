//
//  AuthManager.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/11/22.
//

import Foundation
import Firebase

typealias FirestoreCompletion = (Error?) -> Void
let REF_USERS = Firestore.firestore().collection("Users")
class AuthManager{
    
    private init(){}
    
    static let shared = AuthManager()
    
   
    public func createAccount(email: String, password: String, completion: @escaping(_ e: Error?, _ uid: String?, _ email: String?) -> Void){
        //*Documentation Refrence:
        ///'https://firebase.google.com/docs/auth/ios/password-auth#create_a_password-based_account'
       
        Auth.auth().createUser(withEmail: email, password: password) { result, e in
            if let e = e{
               return completion(e, nil, nil)
            }
           
            if let uid = result?.user.uid, let email = result?.user.email{
               return completion(nil, uid, email)
            }
        }
    }
    
    public func createFirestoreDoc(uid: String, email: String, completion: @escaping(FirestoreCompletion)){
        let data: [String: Any] = [DatabaseUser.email : email, DatabaseUser.uid: uid]
        REF_USERS.document(uid).setData(data) { e in
            if let e = e{
                return completion(e)
            }
            return completion(nil)
        }
    }
}
