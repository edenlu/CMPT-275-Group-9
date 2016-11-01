//
//  ScoreViewController.swift
//  Play
//
//  Created by Bradley on 2016-10-29.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController{

    var s = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Score.text = String(s)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Score: UILabel!

    //GameScreenViewController FinalScore
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
