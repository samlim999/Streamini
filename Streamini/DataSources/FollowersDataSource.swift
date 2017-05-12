//
//  FollowersDataSource.swift
//  Streamini
//
//  Created by Cloud Stream on 07/08/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

class FollowersDataSource: UserStatisticsDataSource {    
    override func reload() {
        UserConnector().followers(NSDictionary(object: userId, forKey: "id"), success: statisticsDataSuccess, failure: statisticsDataFailure)
    }
    
    override func fetchMore() {
        page++
        let dictionary = NSDictionary(objects: [userId, page], forKeys: ["id", "p"])
        UserConnector().followers(dictionary, success: moreStatisticsDataSuccess, failure: statisticsDataFailure)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let user = users[indexPath.row]
        
        if let delegate = userSelectedDelegate {
            delegate.userDidSelected(user)
        }
    }
}
