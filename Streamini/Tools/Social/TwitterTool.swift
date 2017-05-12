//
//  TwitterTool.swift
//  Streamini
//
//  Created by Cloud Stream on 23/06/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterTool: SocialTool {
    func post(username: String, live: NSURL) {
        
        let format  = NSLocalizedString("create_stream_post_message", comment: "")
        let text    = NSString(format: format, username, live.absoluteString)
        let message: [NSObject : AnyObject] = [ "status" : text ]
        
        let client = TWTRAPIClient()
        let url = "https://api.twitter.com/1.1/statuses/update.json";
        let preparedRequest = client.URLRequestWithMethod("POST", URL: url, parameters: message, error: nil)
        client.sendTwitterRequest(preparedRequest, completion: { (response, data, error) -> Void in
        })
        
    }
}
