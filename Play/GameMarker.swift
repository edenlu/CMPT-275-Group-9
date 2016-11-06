//
//  GameMarker.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-27.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit

class GameMarker: GMSMarker {
    var turnedOn: Bool! = nil
    var markerID: String = ""
    var teamName: String = ""
    var markerImage: UIImage!
    override init() {
        super.init()
        turnedOn = false
        //markerImage = imageResize(image: #imageLiteral(resourceName: "marker"), sizeChange: CGSize(width: 20, height: 40))
        markerImage = self.icon
        self.icon = markerImage
        //need a constructor to get data from a document .json or .txt
        markerID = ""
    }
    
    
    
    func enableMarker( enable:Bool)
    {
        turnedOn = enable
        if enable{
            self.icon = markerImage
        }
        else
        {
            self.icon = convertToGrayScale(image: markerImage)
        }
    }
}


func imageResize (image:UIImage, sizeChange:CGSize)-> UIImage{
    
    let hasAlpha = true
    let scale: CGFloat = 0.0 // Use scale factor of main screen
    
    UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
    image.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
    
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    return scaledImage!
}

//Credit to
//from: http://myxcode.net/2015/08/30/converting-an-image-to-black-white-in-swift/
func convertToGrayScale(image: UIImage) -> UIImage {
    let imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
    let colorSpace = CGColorSpaceCreateDeviceGray()
    let width = image.size.width
    let height = image.size.height
    
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
    let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
    
    context?.draw(image.cgImage!, in: imageRect)
    let imageRef = context!.makeImage()
    let newImage = UIImage(cgImage: imageRef!)
    
    return newImage
}
