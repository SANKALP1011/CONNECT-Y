//
//  NewConvoViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 10/08/21.
//

import UIKit
import MessageKit

class MainChatViewController: MessagesViewController {
    
    @IBOutlet var nameLabel : UILabel!
    
    private var message = [MessageModel]()
    
   // var messageModel = MessageModel(sender: "bhb", messageId: "njn" , sentDate: "njn", kind: "nkj")
   //var senderModel = SenderModel(senderId: "bjb", displayName: "hbhb", photoUrl: "jkj")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //message.append(MessageModel(sender: , messageId: <#T##String#>, sentDate: <#T##Date#>, kind: <#T##MessageKind#>))
        
        nameLabel.text = "NAME"
        nameLabel.layer.shadowColor = UIColor.black.cgColor
        
        
        messagesCollectionView.dataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        
     }
    

    
}

extension MainChatViewController: MessagesDataSource , MessagesLayoutDelegate , MessagesDisplayDelegate{
    func currentSender() -> SenderType {
        
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        
    }
    
    
}
