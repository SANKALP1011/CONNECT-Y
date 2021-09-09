//
//  InfoViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 12/08/21.
//

import Foundation
import UIKit
import Firebase


class InfoViewController: UIViewController
{
 
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var yourUserName: UITextField!
    @IBOutlet weak var yourStatus: UITextField!
    
    override func viewDidLoad() {
        updateUI()
        didTapChangePic()
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    private func updateUI()
    {
        profileView.layer.cornerRadius = 30
        profileView.layer.shadowOpacity = 0.5
        profileView.layer.shadowColor = UIColor.black.cgColor
        profileView.layer.shadowRadius = 10
        profileView.layer.shadowOffset = .zero
        
        nameView.layer.cornerRadius = 30
        nameView.layer.shadowOpacity = 0.5
        nameView.layer.shadowColor = UIColor.black.cgColor
        nameView.layer.shadowRadius = 10
        nameView.layer.shadowOffset = .zero
        
        statusView.layer.cornerRadius = 30
        statusView.layer.shadowOpacity = 0.5
        statusView.layer.shadowColor = UIColor.black.cgColor
        statusView.layer.shadowRadius = 10
        statusView.layer.shadowOffset = .zero
        
        yourStatus.layer.cornerRadius = 30
        yourStatus.clipsToBounds = true
        yourUserName.layer.cornerRadius = 30
        yourUserName.clipsToBounds = true
        
        profileImage.layer.cornerRadius = 30
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func didTapChangePic()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_sender:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tap)
        presentPhotoSheet()
    }
    
    @IBAction func didTapImageView(_sender: UITapGestureRecognizer)
    {
        print("IMAGE TAPPED" , _sender)
        presentPhotoSheet()
        
    }
    
    @objc func profileClicked(_sender: UITapGestureRecognizer)
    {
        let tapped = _sender.view as! UIImageView
    }
    
    
    private func logVerifiaction(){
        Firebase.Auth.auth().addStateDidChangeListener { (auth , user) in
            if user != Firebase.Auth.auth().currentUser{
                print("user is logged in")
            }
            else{
                print("user is not logged in")
            }
            
        }
        if FirebaseAuth.Auth.auth().currentUser == nil
         {
            let vc = LogViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalTransitionStyle = .crossDissolve
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }

    
    
}

extension InfoViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func presentPhotoSheet(){
        let permission = UIAlertController(title: "Profile Picture", message: "How Do You Want to Select a Picture?", preferredStyle: .actionSheet)
        permission.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        permission.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.presentCamera()
        }))     
        permission.addAction(UIAlertAction(title: "Photo Libraray", style: .default, handler: { _ in
            self.presentPhotoPicker()
        }))
        present(permission, animated: true, completion: nil)
    }
    
    func presentCamera(){
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.delegate = self
        camera.allowsEditing = true
        present(camera, animated: true)
    }
    
    func presentPhotoPicker(){
        let photoPicker = UIImagePickerController()
        photoPicker.sourceType = .photoLibrary
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        present(photoPicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imagePicked = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        else
        {
            return
        }
        self.profileImage.image = imagePicked
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
