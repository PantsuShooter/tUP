//
//  AuntificationManager.swift
//  tUP
//
//  Created by Home on 21.07.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import FirebaseAuth

final class AuntificationManager {
    
    static public func createUserWith(email: String, password: String) {
      
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
//            debugPrint(authResult)
//            debugPrint(error)
          // ...
        }
        
//        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//
//            debugPrint(authResult)
//            debugPrint(error)
//            //guard let strongSelf = self else { return }
//          // ...
//        }
        
    }
    
    
}
