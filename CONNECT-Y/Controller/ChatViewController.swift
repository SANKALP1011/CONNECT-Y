//
//  ChatViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 10/08/21.
//

import Foundation
import UIKit
import Firebase

class ChatViewController: UIViewController
{
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      userValidate()
    }
    
    private func userValidate(){
        if FirebaseAuth.Auth.auth().currentUser == nil{
            performSegue(withIdentifier: "goToLog", sender: self)
        }
        else{
            print("user Logged In")
        }
    }
    
 
    
   

}
