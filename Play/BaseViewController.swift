//
//  BaseViewController.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-30.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit
import GameKit

// All view controller should able to detect user is login or not
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Leader Board
        authPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authPlayer()
    {
        let player = GKLocalPlayer.localPlayer()
        player.authenticateHandler = { (view, error) in
            
            //1.Player is not login, promote login screen
            if view != nil{
                self.present(view!, animated: true, completion: nil)
            }
                //2.Player is already euthenticated & logged
            else if (player.isAuthenticated) {
                
            }
                //3.error
            else{
                print("\(error) player is not autherized")
            }
        }
    }

}
