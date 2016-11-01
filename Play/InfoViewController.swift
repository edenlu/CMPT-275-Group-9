//
//  InfoViewController.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-27.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit
import GameKit

class InfoViewController: BaseViewController {

    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var UserIcon: UIImageView!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var TeamLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        setUpIcon()
        setUpLabels()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpIcon(){
        UserIcon.image = #imageLiteral(resourceName: "head")
    }
    
    func setUpLabels()
    {
        let player = GKLocalPlayer.localPlayer()
        IDLabel.backgroundColor = UIColor.lightGray
        TeamLabel.backgroundColor = UIColor.lightGray
        ScoreLabel.backgroundColor = UIColor.lightGray
        
        IDLabel.text = player.displayName
        TeamLabel.text = "Mars"
        ScoreLabel.text = "0"
    }
    
    @IBAction func showLB(_ sender: AnyObject) {
        let gcvc = GKGameCenterViewController()
        gcvc.gameCenterDelegate = self
        gcvc.viewState = GKGameCenterViewControllerState.leaderboards
        //gcvc.leaderboardIdentifier = "FastTap"
        //scoreBoard = gcvc.view
        self.present(gcvc, animated: true, completion: nil)
    }
}

extension InfoViewController: GKGameCenterControllerDelegate{
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
}
