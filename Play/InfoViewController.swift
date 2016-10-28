//
//  InfoViewController.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-27.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpIcon(){
//        let iconOffset = self.view.frame.width/8
//        let iconWidth = self.view.frame.height/5
//        
//        let iconOrigin = CGPoint(x: self.view.frame.origin.x + iconOffset,y: self.view.frame.origin.x + iconOffset)
//        let iconSize = CGSize(width: iconWidth, height: iconWidth)
//        UserIcon.frame = CGRect(origin: iconOrigin, size: iconSize)
        UserIcon.image = #imageLiteral(resourceName: "head")
    }
    
    func setUpLabels()
    {
        IDLabel.backgroundColor = UIColor.lightGray
        TeamLabel.backgroundColor = UIColor.lightGray
        ScoreLabel.backgroundColor = UIColor.lightGray
        IDLabel.text = "ABCD"
        TeamLabel.text = "Mars"
        ScoreLabel.text = "0"
    }

}
