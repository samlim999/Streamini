//
//  ProfileStatisticsViewController.swift
//  Streamini
//
//  Created by Cloud Stream on 19/08/15.
//  Copyright (c) 2015 Streamini. All rights reserved.
//

import UIKit

enum ProfileStatisticsType: Int {
    case Following = 0
    case Followers
    case Blocked
    case Streams
}

class ProfileStatisticsViewController: UIViewController, UserSelecting, UserStatusDelegate, MainViewControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    var dataSource: UserStatisticsDataSource?
    var type: ProfileStatisticsType = .Following
    var profileDelegate: ProfileDelegate?

    func configureView() {
        emptyLabel.text = NSLocalizedString("table_no_data", comment: "")
        
        switch type {
        case .Following:    title = NSLocalizedString("profile_following", comment: "")
        case .Followers:    title = NSLocalizedString("profile_followers", comment: "")
        case .Blocked:      title = NSLocalizedString("profile_blocked", comment: "")
        case .Streams:      title = NSLocalizedString("profile_streams", comment: "")
        }
        
        tableView.tableFooterView = UIView()
        tableView.addPullToRefreshWithActionHandler { () -> Void in
            self.dataSource!.reload()
        }
        if type != .Streams {
            tableView.addInfiniteScrollingWithActionHandler { () -> Void in
                self.dataSource!.fetchMore()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

        let userId = UserContainer.shared.logged().id
        dataSource = UserStatisticsDataSource.create(type, userId: userId, tableView: tableView)
        dataSource!.profileDelegate = profileDelegate
        dataSource!.userSelectedDelegate = self
        dataSource!.reload()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Fade)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let sid = segue.identifier {
            if sid == "ProfileStatisticsToJoinStream" {
                let navigationController = segue.destinationViewController as! UINavigationController
                let controller = navigationController.viewControllers[0] as! JoinStreamViewController
                controller.stream = (sender as! StreamCell).stream
                controller.isRecent = true
                controller.delegate = self
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MainViewControllerDelegate
    
    func streamListReload() {
        dataSource!.reload()
    }
    
    func changeMode(isGlobal: Bool) {
    }
    
    // MARK: - UserSelecting
    
    func userDidSelected(user: User) {
        self.showUserInfo(user, userStatusDelegate: self)
    }
    
    // MARK: - UserStatusDelegate
    
    func followStatusDidChange(status: Bool, user: User) {
        dataSource!.updateFollowedStatus(user, status: status)
        profileDelegate!.reload()
    }
    
    func blockStatusDidChange(status: Bool, user: User) {
        dataSource!.updateBlockedStatus(user, status: status)
        profileDelegate!.reload()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
