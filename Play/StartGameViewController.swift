//
//  StartGameViewController.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-27.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

//    @IBAction func GoToScreen(_ sender: AnyObject) {
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//    @IBAction func Next(_ sender: AnyObject) {
//    }
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
