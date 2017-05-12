//
//  FollowerCell.swift
//  Streamini
//
//  Created by Cloud Stream on 22/07/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

class FollowerCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    weak var userSelectedDelegate: UserSelecting?
    var userSelectingHandler: UserSelectingHandler?
    
    func update(user: User) {
        if let delegate = userSelectedDelegate {
            self.userSelectingHandler = UserSelectingHandler(imageView: userImageView, delegate: delegate, user: user)
        }
        
        userImageView.sd_setImageWithURL(user.avatarURL())
        
        usernameLabel.text = user.name
    }
}
