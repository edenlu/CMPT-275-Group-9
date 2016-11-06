//
//  StartGameViewController.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-27.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit

class StartGameViewController: BaseViewController {

    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var gameIcon: UIImageView!
    
    //Variable that store data before segue to this view controller
    var gameID: String = ""
    var teamID: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0.8, blue: 0, alpha: 1)
        gameName.text = gameID
        gameIcon.image = UIImage(named: gameID + "Icon")
        teamName.text = teamID
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SegueToMap(_ sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.present(vc!, animated: false, completion: nil)
    }
}
