//
//  ViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 31/07/21.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet var backImageView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var logView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Firebase.Auth.auth().currentUser == nil {
            print("NOT LOGGED IN")
            self.performSegue(withIdentifier: "goToLog", sender: self)
        }
        else
        {
            print("yes logged in")
            performSegue(withIdentifier: "goToInfo", sender: self)
        }
    }
    
     private func setupUI() {
        backImageView.layer.cornerRadius = 20
        backImageView.layer.shadowOpacity = 0.5
        backImageView.layer.shadowColor = UIColor.black.cgColor
        backImageView.layer.shadowRadius = 20
        backImageView.layer.shadowOffset = .zero
        
        mainImageView.layer.cornerRadius = 20
        mainImageView.layer.shadowOpacity = 0.5
        mainImageView.layer.shadowColor = UIColor.black.cgColor
        mainImageView.layer.shadowRadius = 30
        mainImageView.layer.shadowOffset = .zero
        
        buttonView.layer.cornerRadius = 30
        buttonView.layer.shadowOpacity = 0.5
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowRadius = 10
        buttonView.layer.shadowOffset = .zero
        
        logView.layer.cornerRadius = 30
        logView.layer.shadowOpacity = 0.5
        logView.layer.shadowColor = UIColor.black.cgColor
        logView.layer.shadowRadius = 10
        logView.layer.shadowOffset = .zero
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSign", sender: self)
        }
    
    @IBAction func logPressed(_ sender: UIButton) {
         performSegue(withIdentifier: "goToLog", sender: self)
    }
}

