//
//  ConnectMessageController.swift
//  Streamini
//
//  Created by Cloud Stream on 17/07/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

class ConnectMessageController: NSObject, MessageControllerProtocol {
    var updateCounterFunction: (() -> ())?
    
    init (updateCounterFunction: (() -> ())?) {
        self.updateCounterFunction = updateCounterFunction
        super.init()
    }

    func handle(message: Message) {
        // update count viewers
        if let update = updateCounterFunction {
            update()
        }
    }
}
