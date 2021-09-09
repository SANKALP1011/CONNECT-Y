//
//  LottieViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 09/08/21.
//

import Foundation
import UIKit
import Lottie
import Firebase

class LottieViewController: UIViewController{
    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var nextImage: UIImageView!
    @IBOutlet weak var nextImageView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        lottieAnimation()
        updateUI()
    }
    
        
    private func updateUI()
   {
        nextView.layer.cornerRadius = 30
        nextView.layer.shadowOpacity = 0.5
        nextView.layer.shadowColor = UIColor.black.cgColor
        nextView.layer.shadowColor = UIColor.blue.cgColor
        nextView.layer.shadowRadius = 10
        nextView.layer.shadowOffset = .zero
        
        nextImageView.layer.cornerRadius = 30
        nextImageView.layer.shadowOpacity = 0.5
        nextImageView.layer.shadowColor = UIColor.black.cgColor
        nextImageView.layer.shadowRadius = 10
        nextImageView.layer.shadowOffset = .zero
        
        nextImage.layer.cornerRadius = 30
        nextButton.layer.cornerRadius = 30
        nextButton.clipsToBounds = true
   }
    
    
    func lottieAnimation(){
        let animationView = Lottie.AnimationView(name: "message" )
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(animationView)
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        animationView.center = self.view.center
        animationView.play()
        animationView.loopMode = .loop
    }
    
    
    
    @IBAction func nextButton(_ sender: UIButton) {
    }
    
    
}
