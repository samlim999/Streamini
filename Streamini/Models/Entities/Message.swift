//
//  Message.swift
//  Streamini
//
//  Created by Cloud Stream on 15/07/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

enum MessageType: String {
    case Comment        = "comment"
    case Connected      = "connected"
    case Disconnected   = "disconnected"
    case Like           = "like"
    case Closed         = "closed"
    case Blocked        = "blocked"
}

class Message: NSObject {
    var sender  = User()
    var type    = MessageType.Comment
    var text    = ""
    
    init(type: MessageType, text: String, from: User) {
        super.init()
        self.type   = type
        self.text   = text
        self.sender = from
    }
}
