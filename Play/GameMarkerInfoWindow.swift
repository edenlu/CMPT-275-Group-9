//
//  GameMarkerInfoWindow.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-30.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit

class GameMarkerInfoWindow: UIView {

    @IBOutlet weak var gameIcon: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var locText: UITextView!

    
    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }

}
