//
//  SocialTool.swift
//  Streamini
//
//  Created by Cloud Stream on 23/06/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

protocol SocialTool {
    func post(username: String, live: NSURL)
}

class SocialToolFactory {
    class func getSocial(name: String) -> SocialTool? {
        if name == "Twitter" {
            return TwitterTool()
        }
        return nil
    }
}
