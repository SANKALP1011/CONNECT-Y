//
//  SignViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 01/08/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabaseSwift
import GoogleSignIn


class SignViewController: UIViewController {
    
    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var yourMail: UITextField!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var giSignView: GIDSignInButton!
    @IBOutlet weak var SignInWithGoogle: GIDSignInButton!
    @IBOutlet weak var SsignInView: UIView!
    @IBOutlet weak var SignButton: UIButton!
    
   private let signInConfig = GIDConfiguration.init(clientID: "367437175798-lptot1fh5gj8d23m74pp3038l6b55agv.apps.googleusercontent.com" )
    
    
    override func viewDidLoad()
    {
      setupUI()
    }
    
    private func setupUI()
    {
        signView.layer.cornerRadius = 30
        signView.layer.shadowOpacity = 0.5
        signView.layer.shadowColor = UIColor.black.cgColor
        signView.layer.shadowRadius = 10
        signView.layer.shadowOffset = .zero
        
        signImage.layer.cornerRadius = 30
        signImage.layer.shadowOpacity = 0.5
        signImage.layer.shadowColor = UIColor.black.cgColor
        signImage.layer.shadowRadius = 10
        signImage.layer.shadowOffset = .zero
        
        textView.layer.cornerRadius = 30
        textView.layer.shadowOpacity = 0.5
        textView.layer.shadowColor = UIColor.black.cgColor
        textView.layer.shadowRadius = 10
        textView.layer.shadowOffset = .zero
        
        passView.layer.cornerRadius = 30
        passView.layer.shadowOpacity = 0.5
        passView.layer.shadowColor = UIColor.black.cgColor
        passView.layer.shadowRadius = 10
        passView.layer.shadowOffset = .zero
        
        giSignView.layer.shadowOpacity = 0.5
        giSignView.layer.shadowColor = UIColor.black.cgColor
        giSignView.layer.shadowRadius = 10
        giSignView.layer.shadowOffset = .zero
        
        SsignInView.layer.cornerRadius = 30
        SsignInView.layer.shadowOpacity = 0.5
        SsignInView.layer.shadowColor = UIColor.black.cgColor
        SsignInView.layer.shadowRadius = 10
        SsignInView.layer.shadowOffset = .zero
        
        giSignView.colorScheme = GIDSignInButtonColorScheme.dark
        giSignView.style = GIDSignInButtonStyle.iconOnly
    
        yourMail.layer.cornerRadius = 30
        yourMail.clipsToBounds = true
        passwordText.layer.cornerRadius = 30
        passwordText.clipsToBounds = true
        SignButton.layer.cornerRadius = 30
    }

    
    @IBAction func SignInWithGoogle(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            self.performSegue(withIdentifier: "goToInfo", sender: self)
          }
        }
    
    
    @IBAction func SignButton(_ sender: UIButton) {
        DataBaseManager.shared.checkNewUser(with: yourMail.text!) { [self] (exists) in
            guard !exists
            else
            {
                return
            }
            
            Firebase.Auth.auth().createUser(withEmail: self.yourMail.text!, password: passwordText.text!) { (authResult,eroor) in
            guard let result = authResult , eroor != nil
            else
            {
                print(eroor?.localizedDescription)
                return
                print("signed in")

            }
                
        }
//        if let email = self.yourMail.text , let password = self.passwordText.text{
//               DataBaseManager.shared.checkNewUser(with: self.yourMail.text!) { (exists) in
//                   guard !exists else
//                   {
//                    return
//                   }
//
//            Auth.auth().createUser(withEmail: email, password: password) { [self] (authResult , error) in
//                if let error = error{
//                    print(error.localizedDescription)
//                }
//                else{
//            self.performSegue(withIdentifier: "goToInfo", sender: self)
//           }
//         }
//       }
//            DataBaseManager.shared.insertUserMessage(with: mesaageUser(userEmail: yourMail.text!))
//     }
            
   }
}
    
}
