//
//  ChatTableViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 19/09/21.
//

import UIKit
import Firebase
import JGProgressHUD

class ChatTableViewController: UITableViewController {
    
    private let chatTableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        return tableView
    }()
    
    let spinner = JGProgressHUD(style: .dark)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chatTableView)
        setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
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
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 1
    }
    
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath)
        cell.textLabel?.text = "Welcome to the conversation"
        return cell
   }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToMainChat", sender: self)
    }




}


