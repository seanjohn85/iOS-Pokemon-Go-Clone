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

    //update location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did update")
        if updeteMap < 5 {
            //set the amount of map to display
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 300, 300)
            //set the region
            map.setRegion(region, animated: false)
            updeteMap += 1
        }else{
            manager.stopUpdatingLocation()
        }
        
    }
    
    
    
    //compass button action to repostion map in users location
    
    @IBAction func compassBtn(_ sender: Any){
        //ensure coordinate excists to avoid errors
        if let cord = manager.location?.coordinate{
            //set the amount of map to display
            let region = MKCoordinateRegionMakeWithDistance(cord, 300, 300)
            //set the region
            map.setRegion(region, animated: true)
        }
        
    }


}

