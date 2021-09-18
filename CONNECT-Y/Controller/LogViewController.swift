//
//  LogViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 01/08/21.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class LogViewController: UIViewController {
    
    @IBOutlet weak var logImage: UIImageView!
    @IBOutlet weak var logView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var yourEmailTextF: UITextField!
    @IBOutlet weak var passViewText: UIView!
    @IBOutlet weak var passTextView: UITextField!
    @IBOutlet weak var logFView: UIView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var gView: GIDSignInButton!
    
    private let  signInConfig = GIDConfiguration.init(clientID: "367437175798-lptot1fh5gj8d23m74pp3038l6b55agv.apps.googleusercontent.com" )
    
    override func viewDidLoad() {
       setupUI()
    }
    
   private func setupUI()
   {
    logView.layer.cornerRadius = 30
    logView.layer.shadowOpacity = 0.5
    logView.layer.shadowColor = UIColor.black.cgColor
    logView.layer.shadowRadius = 10
    logView.layer.shadowOffset = .zero
    
    logImage.layer.cornerRadius = 30
    logImage.layer.shadowOpacity = 0.5
    logImage.layer.shadowColor = UIColor.black.cgColor
    logImage.layer.shadowRadius = 10
    logImage.layer.shadowOffset = .zero
    
    emailView.layer.cornerRadius = 30
    emailView.layer.shadowOpacity = 0.5
    emailView.layer.shadowColor = UIColor.black.cgColor
    emailView.layer.shadowRadius = 10
    emailView.layer.shadowOffset = .zero
    
    passViewText.layer.cornerRadius = 30
    passViewText.layer.shadowOpacity = 0.5
    passViewText.layer.shadowColor = UIColor.black.cgColor
    passViewText.layer.shadowRadius = 10
    passViewText.layer.shadowOffset = .zero
    
    logFView.layer.cornerRadius = 30
    logFView.layer.shadowOpacity = 0.5
    logFView.layer.shadowColor = UIColor.black.cgColor
    logFView.layer.shadowRadius = 10
    logFView.layer.shadowOffset = .zero
    
    gView.layer.shadowOpacity = 0.5
    gView.layer.shadowColor = UIColor.black.cgColor
    gView.layer.shadowRadius = 10
    gView.layer.shadowOffset = .zero
    
    gView.colorScheme = GIDSignInButtonColorScheme.dark
    gView.style = GIDSignInButtonStyle.iconOnly
    
    passTextView.layer.cornerRadius = 30
    passTextView.clipsToBounds = true
    yourEmailTextF.layer.cornerRadius = 30
    yourEmailTextF.clipsToBounds = true
    logInButton.layer.cornerRadius = 30
    }
    
    @IBAction func logInButton(_ sender: Any) {
        if let email = yourEmailTextF.text , let password = passTextView.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult , error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "goToInfo", sender: self )
                }
                
            }
          navigationController?.dismiss(animated: true, completion: nil)
    }
}
    
    @IBAction func googleLogIn(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            self.performSegue(withIdentifier: "goToInfo", sender: self)
          }
        }

    }
    
    
    
    

