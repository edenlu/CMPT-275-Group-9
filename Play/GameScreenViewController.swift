//
//  GameScreenViewController.swift
//  Play
//
//  Created by Bradley on 2016-10-29.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {

    var timer = Timer();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var counter=0;
    
    @IBOutlet weak var Counter1: UILabel!
    
    @IBAction func NumTap(_ sender: AnyObject) {
        
        counter=counter+1;
        print(counter)
        Counter1.text = String(counter)
        if (counter==1){
        
            timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        }
    }
    
    
func update(){
    let sb = UIStoryboard(name: "StartGameViewController", bundle: nil)
    let vc = sb.instantiateViewController(withIdentifier: "ScoreView") as! ScoreViewController
    
    vc.s = self.counter
    
    self.present(vc, animated: true, completion: nil)

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
