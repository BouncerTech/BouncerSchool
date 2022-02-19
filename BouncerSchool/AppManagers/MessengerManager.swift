//
//  MessengerManager.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/16/22.
//

import Foundation
import FirebaseAuth
import Firebase

let REF_MESSAGES = Firestore.firestore().collection("Messages")
final class MessengerManager{
    
    private init(){}
    
    static let shared = MessengerManager()
    
    public func sendChat(receiverUid: String, content: String, completion: @escaping(FirestoreCompletion)){
        guard let myUID = Auth.auth().currentUser?.uid else {return completion(nil)}
        
        let document = REF_MESSAGES.document()
        
        let data: [String:Any] = [
            "sender" : myUID,
            "receiver" : receiverUid,
            "content" : content
        ]
        
            document.setData(data, completion: completion)
    }
    
    
    public func downloadChats(senderUid: String, completion: @escaping(_ e: Error?, _ messages: [String]?) -> Void){
        guard let myUID = Auth.auth().currentUser?.uid else {return completion(nil, nil)}
        
        REF_MESSAGES.whereField("sender", isEqualTo: senderUid).whereField("receiver", isEqualTo: myUID).addSnapshotListener { snap, e in
            if let e = e{
                return completion(e, nil)
            }
            
            if let snap = snap{
                let messages = snap.documents.compactMap({$0.data()["content"] as? String})
                
                return completion(nil, messages)
            }
        }
    }
}
