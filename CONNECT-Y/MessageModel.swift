//
//  MessageView.swift
//  CONNECT-Y
//
//  Created by Sankalp Pandey on 20/09/21.
//

import Foundation
import MessageKit

struct MessageModel: MessageType{
    
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
}
