//
//  Messenger.swift
//  Streamini
//
//  Created by Cloud Stream on 07/07/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

protocol Messenger {
    func connect(streamId: UInt)
    func disconnect(streamId: UInt)
    func send(message: Message, streamId: UInt)
    func receive(handler: (message: Message)->())
}

class MessengerFactory: NSObject {
    class func getMessenger(name: String) -> Messenger? {
        if name == "pubnub" {
            return PubNubMessenger()
        }
        return nil
    }
}
