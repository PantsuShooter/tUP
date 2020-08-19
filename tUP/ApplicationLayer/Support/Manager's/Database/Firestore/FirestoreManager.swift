//
//  FirestoreManager.swift
//  tUP
//
//  Created by Home on 21.07.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import Firebase

final class FirestoreManager {
    
    static public let shared = FirestoreManager()
    private let db: Firestore!
    
    private init() {
        db = Firestore.firestore()
    }
        
    public func addSomeData() {

        var ref: DocumentReference? = nil
        ref = db.collection("user").document()
        ref?.setData(["timeShtamp": Date(),
                      "id": ref!.documentID])
        
//        ref = db.collection("usersTest").addDocument(data: [
//            "first": "Ada",
//            "last": "Lovelace",
//            "born": 1815,
//            "id": "nun"
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
        
//        ref?.updateData([
//            "id" : ref?.documentID
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
        
        //debugPrint(ref?.documentID)

    }
    
    //private let db = Firestore.firestore()
    
}
