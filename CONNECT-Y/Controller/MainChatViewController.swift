//
//  NewConvoViewController.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 10/08/21.
//

import UIKit
import MessageKit



class MainChatViewController: MessagesViewController {
    
    
    
    private var messages = [MessageModel]()
    private var sender = SenderModel(senderId: "1", displayName: "John", photoUrl: "new string")
    
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(MessageModel(sender: sender, messageId: "1", sentDate: Date(), kind: .text("Hey,this is a test.")))
        messages.append(MessageModel(sender: sender, messageId: "1", sentDate: Date(), kind: .text("Hey,this is new.")))
        messagesCollectionView.dataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
}
    

    
}

extension MainChatViewController: MessagesDataSource , MessagesLayoutDelegate , MessagesDisplayDelegate{
    func currentSender() -> SenderType {
        return sender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
