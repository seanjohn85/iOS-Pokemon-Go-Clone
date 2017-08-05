//
//  ViewController.swift
//  PokeMonGo
//
//  Created by JOHN KENNY on 05/08/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var map: MKMapView!
    
    //
    var updeteMap = 0
    
    //used to manager the users location
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up manager
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            //shows the users location
            map.showsUserLocation = true
            //update the manager with the users location
            manager.startUpdatingLocation()
        }else{
            //request user permission
            manager.requestWhenInUseAuthorization()
        }
 
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did update")
        if updeteMap < 5 {
            //set the amount of map to display
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 1000, 1000)
            //set the region
            map.setRegion(region, animated: false)
            updeteMap += 1
        }
        
    }

}

