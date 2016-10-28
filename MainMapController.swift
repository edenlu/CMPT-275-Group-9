//
//  MyMapController.swift
//  Play
//
//  Created by Xdimension Studio on 2016-10-17.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import UIKit


class MainMapController: UIViewController{

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var gameListButton: UIButton!
    @IBOutlet weak var friendListButton: UIButton!
    
    
    let mapHeightRatioToFullScreen = 0.85 as CGFloat
    var locManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adjust map screen
        let mapLoc = self.view.frame.origin;
        let mapSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * mapHeightRatioToFullScreen)
        mapView.frame =  CGRect(origin: mapLoc, size: mapSize)
        
        //Setup Buttons
        setUpThreeButton()
        
        //Request authorization
        locManager.delegate = self
        self.locManager.requestAlwaysAuthorization()
        self.locManager.requestWhenInUseAuthorization()
        
        //map delegate - so stupid this cost me hours
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*********************************************************
Button Functions
     
**********************************************************/
    
    //Set up button attributes: size, origin, and icon
    func setUpThreeButton() {
        //Right below the map
        let buttonWidth = self.view.frame.width / 3.0
        let buttonHeight = self.view.frame.height * (1.0 - mapHeightRatioToFullScreen)
        let buttonSize = CGSize(width: buttonWidth, height: buttonHeight)
        
        //get origins of each button
        let buttonLocY = self.view.frame.origin.y + self.view.frame.height * mapHeightRatioToFullScreen
        let infoButtonOrigin = CGPoint(x: self.view.frame.origin.x, y: buttonLocY)
        let listButtonOrigin = CGPoint(x: self.view.frame.origin.x + buttonWidth, y: buttonLocY)
        let friendButtonOrigin = CGPoint(x: self.view.frame.origin.x + 2 * buttonWidth, y: buttonLocY)
        
        infoButton.frame = CGRect(origin: infoButtonOrigin, size: buttonSize)
        gameListButton.frame = CGRect(origin: listButtonOrigin, size: buttonSize)
        friendListButton.frame = CGRect(origin: friendButtonOrigin, size: buttonSize)
        
        //set icons of each button
        infoButton.setBackgroundImage(#imageLiteral(resourceName: "personInfo"), for: UIControlState.normal)
        gameListButton.setBackgroundImage(#imageLiteral(resourceName: "AllGame"), for: UIControlState.normal)
        friendListButton.setBackgroundImage(#imageLiteral(resourceName: "friend"), for: UIControlState.normal)
        
        //remove all the string
//        infoButton.setTitle("", for: UIControlState.normal)
//        gameListButton.setTitle("", for: UIControlState.normal)
//        friendListButton.setTitle("", for: UIControlState.normal)
        
        //Scroll View
//        let scrollerSize = CGSize(width: self.view.frame.width, height: buttonHeight)
//        buttonMenu.frame = CGRect(origin: infoButtonOrigin, size: scrollerSize)
//        buttonMenu.addSubview(infoButton)
//        buttonMenu.addSubview(gameListButton)
//        buttonMenu.addSubview(friendListButton)
    }

}

//Extension to get current location
extension MainMapController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
            locManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            let camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            self.mapView?.animate(to: camera)
            
            let marker = GameMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            marker.title = "Current Location"
            marker.snippet = "At \(location.coordinate)"
            marker.map = mapView
            
            locManager.stopUpdatingLocation()
        }
        
    }

}

//Extension to create custom marker tap event
extension MainMapController: GMSMapViewDelegate{
    
//    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
//        let easy = UIView()
//        return easy
//    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let sb = UIStoryboard(name: "StartGameViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.present(vc!, animated: false, completion: nil)
    }
    
    
//    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//
//        return true;
//    }
    
//    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
//        let startGameStoryBoard = UIStoryboard(name: "StartGameViewController", bundle: nil)
//        let startGameController = startGameStoryBoard.instantiateViewController(withIdentifier: "Start")
//        self.present(startGameController, animated: false, completion: nil)
//    }
    
}

