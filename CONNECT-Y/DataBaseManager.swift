//
//  DataBaseManager.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 20/08/21.
//

import Foundation
import FirebaseDatabase

class DataBaseManager {
    
 static let shared = DataBaseManager()
 public let database = Database.database().reference()
    
    func checkNewUser(with email: String , completion: @escaping ((Bool) -> Void)){
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = email.replacingOccurrences(of: "@", with: "-")
            database.child(safeEmail).observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value as? String
            else{
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    public func insertUserMessage(with user: mesaageUser){
        database.child(user.safeEmail).setValue([
            //"first_name": user.userFirstName,
            //"last_name": user.userLastName
            user.safeEmail
            ])
   }
}


struct mesaageUser
{
   // let userFirstName: String
   // let userLastName: String
    let userEmail: String
    var safeEmail: String{
        var safeEmail = userEmail.replacingOccurrences(of: ".", with: ",")
        safeEmail = userEmail.replacingOccurrences(of: "@", with: ",")
        return safeEmail
    }
   // let userProfilePhoto: String
}
