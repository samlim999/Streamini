//
//  ViewersCollectionViewCell.swift
//  Streamini
//
//  Created by Cloud Stream on 21/07/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

class ViewersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    weak var userSelectedDelegate: UserSelecting?
    var user: User?
    var userSelectingHandler: UserSelectingHandler?
    
    func update(user: User) {
        self.user = user
        
        userImageView.sd_setImageWithURL(user.avatarURL())
        
        if let delegate = userSelectedDelegate {
            self.userSelectingHandler = UserSelectingHandler(imageView: userImageView, delegate: delegate, user: user)
        }
    }
}
